part of 'albums_bloc.dart';

@immutable
abstract class AlbumsEvent {}

class AlbumsLoadEvent extends AlbumsEvent {}

class AlbumsGetEvent extends AlbumsEvent {
  final int userId;

  AlbumsGetEvent(this.userId);
}

class AlbumsExceptionEvent extends AlbumsEvent {
  final Exception exception;

  AlbumsExceptionEvent(this.exception);
}
