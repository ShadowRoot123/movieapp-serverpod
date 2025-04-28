// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:movieapp_flutter/core/entities/user.dart';

import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';

import '../repository/auth_repository.dart';

class UserConfirmRegistrationUseCase
    implements UseCase<User, UserConfirmRegistrationParams> {
  final AuthRepository authRepository;

  UserConfirmRegistrationUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(
      UserConfirmRegistrationParams params) async {
    final confirmationResult = await authRepository.confirmRegistration(
      email: params.email,
      verificationCode: params.verificationCode,
    );
    return await confirmationResult.fold((failure) => left(failure), (r) async {
      return await authRepository.loginWithEmailAndPassword(
          email: params.email, password: params.password);
    });
  }
}

class UserConfirmRegistrationParams {
  final String email;
  final String password;
  final String verificationCode;

  UserConfirmRegistrationParams({
    required this.email,
    required this.password,
    required this.verificationCode,
  });
}
