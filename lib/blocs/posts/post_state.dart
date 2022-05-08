part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostLoading extends PostState {}

class CommentsLoading extends PostState {}

class PostGet extends PostState {
  final List<BeanPost>? list;

  PostGet(this.list);
}

class PostFailed extends PostState {
  final Exception exception;

  PostFailed(this.exception);
}
