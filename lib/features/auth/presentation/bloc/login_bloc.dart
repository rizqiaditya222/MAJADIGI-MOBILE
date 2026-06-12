import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/token_storage.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc
    extends Bloc<LoginEvent, LoginState> {

  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase)
      : super(LoginInitial()) {

    on<LoginSubmitted>(_onLogin);
  }

  Future<void> _onLogin(
      LoginSubmitted event,
      Emitter<LoginState> emit,
      ) async {

    emit(LoginLoading());

    try {

      final user = await loginUseCase(
        email: event.email,
        password: event.password,
      );

      await TokenStorage.saveToken(
        user.token,
      );

      emit(LoginSuccess(user));

    } catch (e) {

      emit(
        LoginFailure(
          e.toString(),
        ),
      );
    }
  }
}