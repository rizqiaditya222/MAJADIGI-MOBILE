import 'package:dartz/dartz.dart';
import 'package:majadigi/core/error/failure.dart';
import 'package:majadigi/features/auth/domain/entities/user_entity.dart';

import '../entities/register_entity.dart';

abstract class AuthRepository {

  Future<UserEntity> register(RegisterEntity data);

  Future<UserEntity> login({
    required String email,
    required String password,
  });

  Future<void> sendVerificationEmail();

  Future<void> verifyEmail(String otpCode);
}
