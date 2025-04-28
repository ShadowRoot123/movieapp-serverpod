// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';

import '../repository/auth_repository.dart';

class UserRegisterUseCase implements UseCase<bool, UserRegisterParams> {
  final AuthRepository authRepository;

  UserRegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(UserRegisterParams params) {
    return authRepository.registerWithEmailAndPassword(
      email: params.email,
      password: params.password,
      username: params.username,
    );
  }
}

class UserRegisterParams {
  final String email;
  final String password;
  final String username;

  UserRegisterParams({
    required this.email,
    required this.password,
    required this.username,
  });
}
