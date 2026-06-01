import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/daha_husada_entity.dart';
import '../../data/datasources/daha_husada_remote_datasource.dart';

// --- EVENT ---
abstract class KamarEvent {}
class FetchKamar extends KamarEvent {}

// --- STATE ---
abstract class KamarState {}
class KamarInitial extends KamarState {}
class KamarLoading extends KamarState {}
class KamarLoaded extends KamarState {
  final RuanganResponseEntity data;
  KamarLoaded(this.data);
}
class KamarError extends KamarState {
  final String message;
  KamarError(this.message);
}

// --- BLOC ---
class KamarBloc extends Bloc<KamarEvent, KamarState> {
  final DahaHusadaRemoteDatasource remoteDatasource;

  KamarBloc({required this.remoteDatasource}) : super(KamarInitial()) {
    on<FetchKamar>((event, emit) async {
      emit(KamarLoading());
      try {
        final data = await remoteDatasource.getListKamar();
        emit(KamarLoaded(data));
      } catch (e) {
        emit(KamarError(e.toString()));
      }
    });
  }
}