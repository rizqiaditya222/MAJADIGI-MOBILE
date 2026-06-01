import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majadigi/features/daha_husada/domain/entities/daha_husada_entity.dart';
import 'package:majadigi/features/daha_husada/data/datasources/daha_husada_remote_datasource.dart';

// --- STATE ---
class AntrianState {
  final bool isLoading;
  final String? error;
  final List<PoliklinikEntity> poliList;
  final List<DokterEntity> dokterList;
  final PoliklinikEntity? selectedPoli;
  final DokterEntity? selectedDokter;
  final AntrianEntity? antrianData;

  AntrianState({
    this.isLoading = false,
    this.error,
    this.poliList = const [],
    this.dokterList = const [],
    this.selectedPoli,
    this.selectedDokter,
    this.antrianData,
  });

  AntrianState copyWith({
    bool? isLoading,
    String? error,
    List<PoliklinikEntity>? poliList,
    List<DokterEntity>? dokterList,
    PoliklinikEntity? selectedPoli,
    DokterEntity? selectedDokter,
    AntrianEntity? antrianData,
    bool clearDokter = false,
    bool clearAntrian = false,
  }) {
    return AntrianState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      poliList: poliList ?? this.poliList,
      dokterList: clearDokter ? [] : (dokterList ?? this.dokterList),
      selectedPoli: selectedPoli ?? this.selectedPoli,
      selectedDokter: clearDokter ? null : (selectedDokter ?? this.selectedDokter),
      antrianData: clearAntrian ? null : (antrianData ?? this.antrianData),
    );
  }
}

// --- EVENT ---
abstract class AntrianEvent {}
class FetchPoliklinik extends AntrianEvent {}
class ChangePoli extends AntrianEvent {
  final PoliklinikEntity poli;
  ChangePoli(this.poli);
}
class ChangeDokter extends AntrianEvent {
  final DokterEntity dokter;
  ChangeDokter(this.dokter);
}
class FetchInfoAntrian extends AntrianEvent {}
class ResetAntrian extends AntrianEvent {}

// --- BLOC ---
class AntrianBloc extends Bloc<AntrianEvent, AntrianState> {
  final DahaHusadaRemoteDatasource remoteDatasource;

  AntrianBloc({required this.remoteDatasource}) : super(AntrianState()) {
    
    on<FetchPoliklinik>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final poliList = await remoteDatasource.getListPoliklinik();
        emit(state.copyWith(isLoading: false, poliList: poliList));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    on<ChangePoli>((event, emit) async {
      emit(state.copyWith(isLoading: true, selectedPoli: event.poli, clearDokter: true, clearAntrian: true));
      try {
        final dokterList = await remoteDatasource.getListDokter(event.poli.id);
        emit(state.copyWith(isLoading: false, dokterList: dokterList));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    on<ChangeDokter>((event, emit) {
      emit(state.copyWith(selectedDokter: event.dokter, clearAntrian: true));
    });

    on<FetchInfoAntrian>((event, emit) async {
      if (state.selectedPoli == null || state.selectedDokter == null) return;
      
      emit(state.copyWith(isLoading: true));
      try {
        final data = await remoteDatasource.getInfoAntrian(state.selectedPoli!.id, state.selectedDokter!.id);
        emit(state.copyWith(isLoading: false, antrianData: data));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    on<ResetAntrian>((event, emit) {
      emit(state.copyWith(clearAntrian: true));
    });
  }
}