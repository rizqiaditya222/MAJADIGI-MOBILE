import 'package:dartz/dartz.dart';
import 'package:majadigi/core/error/failure.dart';
import 'package:majadigi/features/auth/domain/entities/user_entity.dart';
import 'package:majadigi/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return authRepository.login(email, password);
  }
}