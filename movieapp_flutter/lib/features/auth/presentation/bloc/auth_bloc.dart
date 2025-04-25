// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movieapp_flutter/features/app_user/presentation/cubit/app_user_cubit.dart';
import 'package:movieapp_flutter/core/entities/user.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';
import 'package:movieapp_flutter/features/auth/domain/usecases/current_user.dart';
import 'package:movieapp_flutter/features/auth/domain/usecases/user_login.dart';
import 'package:movieapp_flutter/features/auth/domain/usecases/user_logout.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLoginUseCase userLoginUseCase;
  final CurrentUserUseCase currentUser;
  final UserLogoutUseCase userLogout;
  final AppUserCubit appUserCubit;

  AuthBloc({
    required this.userLoginUseCase,
    required this.currentUser,
    required this.userLogout,
    required this.appUserCubit,
  }) : super(AuthStateInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthStateLoading());
    });
    on<AuthLoginEvent>(_onAuthLogin);
    on<AuthIsUserLoggedInEvent>(_onAuthIsUserLoggedIn);
    on<AuthLogoutEvent>(_onAuthLogout);
  }

  Future<void> _onAuthLogin(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    final result = await userLoginUseCase(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold((failure) {
      emit(AuthStateFailure(failure.message));
    }, (user) => _emitAuthSuccess(user, emit));
  }

  Future<void> _onAuthIsUserLoggedIn(
      AuthIsUserLoggedInEvent event, Emitter<AuthState> emit) async {
    final result = await currentUser(NoParams());
    result.fold((failure) {
      emit(AuthStateFailure(failure.message));
    }, (user) => _emitAuthSuccess(user, emit));
  }

  FutureOr<void> _onAuthLogout(
      AuthLogoutEvent event, Emitter<AuthState> emit) async {
    final result = await userLogout(NoParams());

    result.fold(
      (failure) => emit(AuthStateFailure(failure.message)),
      (_) {
        appUserCubit.logout();
        emit(AuthStateInitial());
      },
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    appUserCubit.updateUser(user);
    emit(AuthStateSuccess(user));
  }
}
