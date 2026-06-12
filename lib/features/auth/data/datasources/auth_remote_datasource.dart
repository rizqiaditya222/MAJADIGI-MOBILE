    import 'package:dio/dio.dart';

    import '../models/register_request_model.dart';
    import '../models/user_model.dart';

    abstract class AuthRemoteDatasource {
      Future<UserModel> login({
        required String email,
        required String password,
      });

      Future<UserModel> register(
          RegisterRequestModel request,
          );

      Future<void> sendVerificationEmail();

      Future<void> verifyEmail(String otpCode);
    }

    class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
      final Dio dio;

      AuthRemoteDatasourceImpl(this.dio);

      @override
      Future<UserModel> login({
        required String email,
        required String password,
      }) async {
        final response = await dio.post(
          '/api/auth/login',
          data: {
            "email": email,
            "password": password,
          },
        );

        final data = response.data['data'];

        return UserModel.fromJson(
          data['user'],
          data['token'],
        );
      }

      @override
      Future<UserModel> register(
          RegisterRequestModel request,
          ) async {
        final response = await dio.post(
          '/api/auth/register',
          data: request.toJson(),
        );

        return UserModel.fromJson(
          response.data['data']['user'],
          response.data['data']['token'] ?? '',
        );
      }

      @override
      Future<void> sendVerificationEmail() async {
        await dio.get(
          '/api/auth/send-verification-email',
        );
      }

      @override
      Future<void> verifyEmail(String otpCode) async {
        await dio.post(
          '/api/auth/verify-email',
          data: {
            "otp_code": otpCode,
          },
        );
      }
    }