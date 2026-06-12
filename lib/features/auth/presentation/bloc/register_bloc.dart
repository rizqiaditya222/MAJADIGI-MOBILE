import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majadigi/features/auth/presentation/bloc/register.event.dart';
import 'package:majadigi/features/auth/presentation/bloc/register_state.dart';

import '../../domain/usecases/regsiter_usecase.dart';

class RegisterBloc
    extends Bloc<RegisterEvent, RegisterState> {

  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase)
      : super(RegisterInitial()) {

    on<RegisterSubmitted>(_onRegister);
  }

  Future<void> _onRegister(
      RegisterSubmitted event,
      Emitter<RegisterState> emit,
      ) async {
    try {
      emit(RegisterLoading());

      await registerUseCase(event.data);

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}