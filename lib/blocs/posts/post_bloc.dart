import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_app/models/bean_post.dart';
import 'package:people_app/storage/repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoading()) {
    on<GetPostsEvent>(_onGetPosts);
  }

  Repository _repository = Repository();

  void _onGetPosts(GetPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());

    try {
      final items = await _repository.getPosts(event.id);

      emit(PostGet(items));
    } catch (error) {
      emit(PostFailed(error as Exception));
    }
  }
}
