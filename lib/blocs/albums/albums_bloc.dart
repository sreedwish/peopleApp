import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:people_app/models/bean_albums.dart';
import 'package:people_app/rest/apiClient.dart';
import 'package:dio/dio.dart';
import 'package:people_app/storage/repository.dart';

part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc() : super(AlbumsLoading()) {
    on<AlbumsGetEvent>(_onAlbumsGet);
  }

  Repository _repository = Repository();

  void _onAlbumsGet(AlbumsGetEvent event, Emitter<AlbumsState> emit) async {
    emit(AlbumsLoading());

    try {
      final list = await _repository.getAlbums(event.userId);

      emit(AlbumsGet(list));
    } catch (exception) {
      emit(AlbumsException(exception as Exception));
    }
  }
}
