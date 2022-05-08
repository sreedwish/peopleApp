part of 'photo_bloc_cubit.dart';

@immutable
abstract class PhotoBlocState {}

class PhotoBlocLoading extends PhotoBlocState {}

class PhotoBlocGetState extends PhotoBlocState {
  final List<BeanPhotos> list;

  PhotoBlocGetState(this.list);
}

class PhotoBlocExceptionState extends PhotoBlocState {
  final Exception exception;

  PhotoBlocExceptionState(this.exception);
}
