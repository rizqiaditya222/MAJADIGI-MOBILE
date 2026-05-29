import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:majadigi/core/error/failure.dart';

import 'package:majadigi/features/auth/domain/entities/user_entity.dart';
import 'package:majadigi/features/auth/domain/repositories/auth_repository.dart';
import 'package:majadigi/features/auth/data/datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    try {
      final result = await remoteDatasource.login(email, password);
      return Right(result);
    } on DioException catch (e) {
      // DioExceptionType.badResponse biasanya berarti server membalas HTTP 4xx/5xx.
      // Ambil pesan dari body kalau ada, biar UI nggak cuma dapat string mentah.
      String message = 'Login gagal';

      final data = e.response?.data;
      if (data is Map) {
        final m = data['message'] ?? data['error'] ?? data['msg'];
        if (m is String && m.trim().isNotEmpty) message = m;
      } else if (data is String && data.trim().isNotEmpty) {
        message = data;
      }

      // Kalau masih generic, tambahkan info status code.
      final status = e.response?.statusCode;
      if (status != null && message == 'Login gagal') {
        message = 'Login gagal (HTTP $status)';
      }

      return Left(ServerFailure(message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // Minimal stub; implement real logout (e.g. token removal) as needed
    return Right(null);
  }
}