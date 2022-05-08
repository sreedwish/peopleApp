import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_app/blocs/posts/post_bloc.dart';
import 'blocs/albums/albums_bloc.dart';
import 'blocs/comments/comments_bloc_cubit.dart';
import 'blocs/photos/photo_bloc_cubit.dart';
import 'blocs/users/user_bloc.dart';
import 'views/albumsPage.dart';
import 'views/photoExpandPage.dart';
import 'views/photosPage.dart';
import 'package:people_app/constants.dart';
import 'views/postListsPage.dart';
import 'views/usersListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserBloc()..add(GetUsers()),
        ),
        BlocProvider(
          create: (_) => PostBloc(),
        ),
        BlocProvider(
          create: (_) => CommentsBlocCubit(),
        ),
        BlocProvider(
          create: (_) => AlbumsBloc(),
        ),
        BlocProvider(
          create: (_) => PhotoBlocCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'People',
        initialRoute: routeHome,
        routes: {
          routeHome: (_) => UsersList(),
          routePosts: (_) => PostLists(),
          routeAlbums: (_) => Albums(),
          routePhotos: (_) => Photos(),
          routePhotoExpand: (_) => PhotoExpand(),
        },
      ),
    );
  }
}
