import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:people_app/models/bean_user.dart';
import 'package:people_app/rest/apiClient.dart';
import 'package:dio/dio.dart';
import 'package:people_app/storage/repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UsersLoading()) {
    on<GetUsers>(_onStarted);
  }

  Repository _repository = Repository();

  void _onStarted(GetUsers event, Emitter<UserState> emit) async {
    emit(UsersLoading());
    try {
      final List<BeanUser> items = await _repository.getUsers();

      emit(UsersGet(items));
    } catch (error) {
      emit(UsersFailed(error as Exception));
    }
  }
}
