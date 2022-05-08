import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:people_app/models/bean_photos.dart';

import 'package:people_app/storage/repository.dart';

part 'photo_bloc_state.dart';

class PhotoBlocCubit extends Cubit<PhotoBlocState> {
  PhotoBlocCubit() : super(PhotoBlocLoading());

  Repository _repository = Repository();

  void getPhotos(int albumId) async {
    emit(PhotoBlocLoading());

    try {
      final list = await _repository.getPhotos(albumId);

      emit(PhotoBlocGetState(list));
    } catch (exception) {
      emit(PhotoBlocExceptionState(exception as Exception));
    }
  }
}
