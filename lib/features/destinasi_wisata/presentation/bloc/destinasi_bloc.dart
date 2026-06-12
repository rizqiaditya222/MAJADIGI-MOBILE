import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majadigi/features/destinasi_wisata/data/datasources/destinasi_remote_datasource.dart';
import 'package:majadigi/features/destinasi_wisata/domain/entities/destinasi_entity.dart';

// --- STATE ---
class DestinasiState {
  final bool isLoading;
  final String? error;
  
  final List<DestinasiEntity> listAll;
  final List<DestinasiEntity> listPopuler;
  final List<DestinasiEntity> listTerdekat;
  final DestinasiEntity? detail;

  DestinasiState({
    this.isLoading = false, this.error,
    this.listAll = const [], this.listPopuler = const [], this.listTerdekat = const [],
    this.detail,
  });

  DestinasiState copyWith({
    bool? isLoading, String? error,
    List<DestinasiEntity>? listAll, List<DestinasiEntity>? listPopuler, List<DestinasiEntity>? listTerdekat,
    DestinasiEntity? detail,
  }) {
    return DestinasiState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      listAll: listAll ?? this.listAll,
      listPopuler: listPopuler ?? this.listPopuler,
      listTerdekat: listTerdekat ?? this.listTerdekat,
      detail: detail ?? this.detail,
    );
  }
}

// --- EVENTS ---
abstract class DestinasiEvent {}
class FetchAllAndPopular extends DestinasiEvent {}
class FetchNearby extends DestinasiEvent { final double lat; final double lon; FetchNearby(this.lat, this.lon); }
class FetchDetail extends DestinasiEvent { final int id; FetchDetail(this.id); }

// --- BLOC ---
class DestinasiBloc extends Bloc<DestinasiEvent, DestinasiState> {
  final DestinasiRemoteDatasource remoteDatasource;

  DestinasiBloc({required this.remoteDatasource}) : super(DestinasiState()) {
    
    // Event ini mengambil data "Semua" dan "Populer" sekaligus untuk layar utama
    on<FetchAllAndPopular>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));
      try {
        final all = await remoteDatasource.getDestinations(1, 10, "");
        final populer = await remoteDatasource.getPopularDestinations(1, 10, "");
        emit(state.copyWith(isLoading: false, listAll: all, listPopuler: populer));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    on<FetchNearby>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));
      try {
        final nearby = await remoteDatasource.getNearbyDestinations(1, 10, "", event.lat, event.lon);
        emit(state.copyWith(isLoading: false, listTerdekat: nearby));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    on<FetchDetail>((event, emit) async {
      emit(state.copyWith(isLoading: true, detail: null, error: null));
      try {
        final detail = await remoteDatasource.getDestinationDetail(event.id);
        emit(state.copyWith(isLoading: false, detail: detail));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });
  }
}