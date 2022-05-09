import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_app/blocs/albums/albums_bloc.dart';
import 'package:people_app/blocs/posts/post_bloc.dart';
import 'package:people_app/blocs/users/user_bloc.dart';
import 'package:people_app/constants.dart';
import 'package:people_app/uiUtilities/styles.dart';
import '../models/bean_user.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('People'),
        leading: Icon(Icons.account_circle),
      ),
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return Center(child: const CircularProgressIndicator());
            }

            if (state is UsersGet) {
              if (state.list!.isEmpty) {
                //Retry button
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Can not retrieve Users!'),
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<UserBloc>().add(GetUsers());
                          },
                          child: Text('Retry'.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: state.list!.length,
                itemBuilder: (con, i) {
                  BeanUser user = state.list![i];
                  return UserItem(user);
                },
              );
            }

            return Center(child: const Text('No Users!'));
          },
        ),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final BeanUser _user;

  const UserItem(this._user);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user.name ?? '',
                    style: headline1,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${_user.company == null ? 'unknown' : _user.company!.name}',
                    style: bodyText,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                //Photo Album Button
                IconButton(
                  onPressed: () {
                    int? userId = _user.id;
                    if (userId != null) {
                      context.read<AlbumsBloc>().add(AlbumsGetEvent(userId));
                    }

                    Navigator.of(context).pushNamed(routeAlbums);
                  },
                  icon: Icon(
                    Icons.photo_album,
                    color: Colors.blueAccent,
                    size: 24,
                  ),
                ),
                //Posts Button
                IconButton(
                  onPressed: () {
                    int? userId = _user.id;
                    if (userId != null) {
                      context.read<PostBloc>().add(GetPostsEvent(userId));
                    }

                    Navigator.of(context)
                        .pushNamed(routePosts, arguments: _user.id);
                  },
                  icon: Icon(
                    Icons.text_snippet,
                    color: Colors.red,
                    size: 24,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
