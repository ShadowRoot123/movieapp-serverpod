part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthStateInitial extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateSuccess extends AuthState {
  final User user;

  AuthStateSuccess(this.user);
}

final class AuthStateFailure extends AuthState {
  final String message;

  AuthStateFailure(this.message);
}
