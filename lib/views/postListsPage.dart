// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_app/blocs/comments/comments_bloc_cubit.dart';
import 'package:people_app/blocs/posts/post_bloc.dart';
import '../models/bean_comments.dart';
import '../models/bean_post.dart';
import 'package:people_app/uiUtilities/styles.dart';

class PostLists extends StatelessWidget {
  int? userId;

  PostLists({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            if (state is PostLoading) {
              return Center(child: const CircularProgressIndicator());
            }

            if (state is PostGet) {
              return ListView.builder(
                itemCount: state.list!.length,
                itemBuilder: (con, i) {
                  BeanPost post = state.list![i];
                  return SinglePost(
                    post: post,
                  );
                },
              );
            }

            return Center(child: const Text('No Posts!'));
          }),
        ),
      ),
    );
  }
}

class SinglePost extends StatelessWidget {
  final BeanPost? post;
  final List<Widget> commentsList = [];

  SinglePost({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return postWidget(context);
  }

  Widget postWidget(BuildContext con) {
    return BlocConsumer<CommentsBlocCubit, CommentsBlocState>(
      listener: (context, state) {
        if (state is CommentsBlocLoad) {
          commentsList.clear();
        }

        if (state is CommentsBlocGet) {
          int i = 0;
          for (BeanComment c in state.list) {
            if (i < 3) {
              if (i == 0) {
                Widget t = Container(
                  child: Text(
                    'Comments',
                    style: bodyText.copyWith(color: Colors.white, fontSize: 10),
                  ),
                  color: Colors.black,
                  padding: EdgeInsets.fromLTRB(2, 2, 10, 2),
                  margin: EdgeInsets.symmetric(vertical: 4),
                );
                commentsList.add(t);
              }

              Widget w = Comment(
                comment: c,
              );
              commentsList.add(w);
              commentsList.add(Divider());
            }
            i++;
          }
        }
      },
      builder: (context, state) {
        if (state is CommentsBlocLoad) {
          commentsList.clear();
        }

        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.platform,
            title: Text(
              '${post!.title ?? ''}'.toUpperCase(),
              style: headline1,
            ),
            subtitle: Text(
              '${post!.body ?? ''}',
              style: bodyText.copyWith(fontSize: 12),
            ),
            initiallyExpanded: false,
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            onExpansionChanged: (val) {
              if (val) {
                con.read<CommentsBlocCubit>().getComments(post!.id ?? 0);
              }
            },
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: commentsList,
          ),
        );
      },
    );
  }
}

class Comment extends StatelessWidget {
  final BeanComment? comment;

  const Comment({this.comment});

  @override
  Widget build(BuildContext context) {
    if (comment == null) {
      return Container();
    }

    String body = comment!.body ?? '';
    String user = comment!.name ?? '';
    String email = comment!.email ?? '';

    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '"$body"',
            style: commentStyle.copyWith(color: Colors.blue),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            user.toUpperCase(),
            style: regular.copyWith(fontSize: 13, color: Colors.black),
            overflow: TextOverflow.fade,
          ),
          Text(
            email,
            style: commentStyle.copyWith(color: Colors.red),
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
