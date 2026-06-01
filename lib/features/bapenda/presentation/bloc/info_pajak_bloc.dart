import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majadigi/features/bapenda/domain/entities/info_pajak_entity.dart';
import 'package:majadigi/features/bapenda/data/datasources/info_pajak_remote_datasource.dart';

abstract class InfoPajakEvent {}
class FetchInfoPajak extends InfoPajakEvent {
  final String platNomor;
  final String nomorRangka;
  FetchInfoPajak({required this.platNomor, required this.nomorRangka});
}

abstract class InfoPajakState {}
class InfoPajakInitial extends InfoPajakState {}
class InfoPajakLoading extends InfoPajakState {}
class InfoPajakLoaded extends InfoPajakState {
  final InfoPajakEntity data;
  InfoPajakLoaded(this.data);
}
class InfoPajakError extends InfoPajakState {
  final String message;
  InfoPajakError(this.message);
}

class InfoPajakBloc extends Bloc<InfoPajakEvent, InfoPajakState> {
  final InfoPajakRemoteDatasource remoteDatasource;

  InfoPajakBloc({required this.remoteDatasource}) : super(InfoPajakInitial()) {
    on<FetchInfoPajak>((event, emit) async {
      emit(InfoPajakLoading());
      try {
        final data = await remoteDatasource.getInfoPajak(event.platNomor, event.nomorRangka);
        emit(InfoPajakLoaded(data));
      } catch (e) {
        emit(InfoPajakError(e.toString()));
      }
    });
  }
}