part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UsersLoading extends UserState {}

class UsersGet extends UserState {
  final List<BeanUser>? list;

  UsersGet(this.list);
}

class UsersFailed extends UserState {
  final Exception exception;

  UsersFailed(this.exception);
}
