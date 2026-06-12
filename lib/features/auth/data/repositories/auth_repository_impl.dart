import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:majadigi/core/error/failure.dart';

import 'package:majadigi/features/auth/domain/entities/user_entity.dart';
import 'package:majadigi/features/auth/domain/repositories/auth_repository.dart';
import 'package:majadigi/features/auth/data/datasources/auth_remote_datasource.dart';

import '../../domain/entities/register_entity.dart';
import '../models/register_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});

  @override
  Future<UserEntity> register(
      RegisterEntity data,
      ) async {
    final result = await remoteDatasource.register(
      RegisterRequestModel(
        name: data.name,
        email: data.email,
        password: data.password,
        nik: data.nik,
        address: data.address,
        number: data.number,
        gender: data.gender,
        dateOfBirth: data.dateOfBirth,
      ),
    );

    return result;
  }

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) {
    return remoteDatasource.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> sendVerificationEmail() {
    return remoteDatasource.sendVerificationEmail();
  }

  @override
  Future<void> verifyEmail(String otpCode) {
    return remoteDatasource.verifyEmail(otpCode);
  }
}