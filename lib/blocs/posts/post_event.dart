part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetPostsEvent extends PostEvent {
  final int id;

  GetPostsEvent(this.id);
}
