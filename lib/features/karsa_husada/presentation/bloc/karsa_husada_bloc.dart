import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majadigi/features/karsa_husada/domain/entities/karsa_husada_entity.dart';
import 'package:majadigi/features/karsa_husada/data/datasources/karsa_husada_remote_datasource.dart';

// --- EVENT ---
abstract class KarsaHusadaEvent {}
class FetchKamarKarsaHusada extends KarsaHusadaEvent {}

// --- STATE ---
abstract class KarsaHusadaState {}
class KarsaHusadaInitial extends KarsaHusadaState {}
class KarsaHusadaLoading extends KarsaHusadaState {}
class KarsaHusadaLoaded extends KarsaHusadaState {
  final KarsaHusadaResponseEntity data;
  KarsaHusadaLoaded(this.data);
}
class KarsaHusadaError extends KarsaHusadaState {
  final String message;
  KarsaHusadaError(this.message);
}

// --- BLOC ---
class KarsaHusadaBloc extends Bloc<KarsaHusadaEvent, KarsaHusadaState> {
  final KarsaHusadaRemoteDatasource remoteDatasource;

  KarsaHusadaBloc({required this.remoteDatasource}) : super(KarsaHusadaInitial()) {
    on<FetchKamarKarsaHusada>((event, emit) async {
      emit(KarsaHusadaLoading());
      try {
        final data = await remoteDatasource.getListKamar();
        emit(KarsaHusadaLoaded(data));
      } catch (e) {
        emit(KarsaHusadaError(e.toString()));
      }
    });
  }
}