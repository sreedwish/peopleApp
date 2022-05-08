part of 'albums_bloc.dart';

@immutable
abstract class AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsGet extends AlbumsState {
  final List<BeanAlbums> list;

  AlbumsGet(this.list);
}

class AlbumsException extends AlbumsState {
  final Exception exception;

  AlbumsException(this.exception);
}
