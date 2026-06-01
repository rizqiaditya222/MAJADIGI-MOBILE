import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/daha_husada_entity.dart';
import '../../data/datasources/daha_husada_remote_datasource.dart';

// --- EVENT ---
abstract class OperasiEvent {}
class FetchOperasi extends OperasiEvent {}

// --- STATE ---
abstract class OperasiState {}
class OperasiInitial extends OperasiState {}
class OperasiLoading extends OperasiState {}
class OperasiLoaded extends OperasiState {
  final List<OperasiEntity> operasiList;
  OperasiLoaded(this.operasiList);
}
class OperasiError extends OperasiState {
  final String message;
  OperasiError(this.message);
}

// --- BLOC ---
class OperasiBloc extends Bloc<OperasiEvent, OperasiState> {
  final DahaHusadaRemoteDatasource remoteDatasource;

  OperasiBloc({required this.remoteDatasource}) : super(OperasiInitial()) {
    on<FetchOperasi>((event, emit) async {
      emit(OperasiLoading());
      try {
        final data = await remoteDatasource.getListOperasi();
        emit(OperasiLoaded(data));
      } catch (e) {
        emit(OperasiError(e.toString()));
      }
    });
  }
}