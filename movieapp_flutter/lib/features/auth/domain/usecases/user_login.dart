import 'package:fpdart/fpdart.dart';
import 'package:movieapp_flutter/core/entities/user.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';

import '../repository/auth_repository.dart';

class UserLoginUseCase implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;

  UserLoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) {
    return authRepository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
