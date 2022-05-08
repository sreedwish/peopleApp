part of 'comments_bloc_cubit.dart';

@immutable
abstract class CommentsBlocState {}

class CommentsBlocInitial extends CommentsBlocState {}

class CommentsBlocLoad extends CommentsBlocState {}

class CommentsBlocGet extends CommentsBlocState {
  final List<BeanComment> list;

  CommentsBlocGet(this.list);
}

class CommentsBlocException extends CommentsBlocState {
  final Exception exception;

  CommentsBlocException(this.exception);
}
