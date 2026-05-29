import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majadigi/core/error/failure.dart' as failures;
import 'package:majadigi/features/auth/domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await loginUsecase.call(event.email, event.password);
    result.fold(
      (failure) {
        String message = 'Something went wrong';
        try {
          // If failure has a message (ServerFailure), use it
          if (failure is failures.ServerFailure) message = failure.message;
        } catch (_) {}
        emit(LoginFailure(message));
      },
      (user) => emit(LoginSuccess(user)),
    );
  }
}
