import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majadigi/features/skrining_etibi/data/datasources/etibi_remote_datasource.dart';
import 'package:majadigi/features/skrining_etibi/domain/entities/etibi_entity.dart';

// --- STATE ---
class EtibiState {
  final bool isLoading;
  final bool isSuccessSubmit;
  final String? error;

  final List<EtibiLocationEntity> listKota;
  final List<EtibiLocationEntity> listKecamatan;
  final List<EtibiLocationEntity> listKelurahan;
  
  final EtibiLocationEntity? selectedKota;
  final EtibiLocationEntity? selectedKecamatan;
  final EtibiLocationEntity? selectedKelurahan;

  final List<EtibiHistoryEntity> historyList;
  final EtibiDetailEntity? detailData; // <-- Sudah ditambahkan

  EtibiState({
    this.isLoading = false, this.isSuccessSubmit = false, this.error,
    this.listKota = const [], this.listKecamatan = const [], this.listKelurahan = const [],
    this.selectedKota, this.selectedKecamatan, this.selectedKelurahan,
    this.historyList = const [],
    this.detailData, // <-- Sudah ditambahkan
  });

  EtibiState copyWith({
    bool? isLoading, bool? isSuccessSubmit, String? error,
    List<EtibiLocationEntity>? listKota, List<EtibiLocationEntity>? listKecamatan, List<EtibiLocationEntity>? listKelurahan,
    EtibiLocationEntity? selectedKota, EtibiLocationEntity? selectedKecamatan, EtibiLocationEntity? selectedKelurahan,
    List<EtibiHistoryEntity>? historyList,
    EtibiDetailEntity? detailData, // <-- Sudah ditambahkan
    bool resetKecamatan = false, bool resetKelurahan = false,
  }) {
    return EtibiState(
      isLoading: isLoading ?? this.isLoading,
      isSuccessSubmit: isSuccessSubmit ?? this.isSuccessSubmit,
      error: error,
      listKota: listKota ?? this.listKota,
      listKecamatan: resetKecamatan ? [] : (listKecamatan ?? this.listKecamatan),
      listKelurahan: resetKelurahan ? [] : (listKelurahan ?? this.listKelurahan),
      selectedKota: selectedKota ?? this.selectedKota,
      selectedKecamatan: resetKecamatan ? null : (selectedKecamatan ?? this.selectedKecamatan),
      selectedKelurahan: resetKelurahan ? null : (selectedKelurahan ?? this.selectedKelurahan),
      historyList: historyList ?? this.historyList,
      detailData: detailData ?? this.detailData, // <-- Sudah ditambahkan
    );
  }
}

// --- EVENTS ---
abstract class EtibiEvent {}
class FetchKota extends EtibiEvent {}
class ChangeKota extends EtibiEvent { final EtibiLocationEntity kota; ChangeKota(this.kota); }
class ChangeKecamatan extends EtibiEvent { final EtibiLocationEntity kecamatan; ChangeKecamatan(this.kecamatan); }
class ChangeKelurahan extends EtibiEvent { final EtibiLocationEntity kelurahan; ChangeKelurahan(this.kelurahan); }
class FetchHistory extends EtibiEvent {}
class SubmitEtibiForm extends EtibiEvent { final Map<String, dynamic> formData; SubmitEtibiForm(this.formData); }
class FetchDetailHistory extends EtibiEvent { final int id; FetchDetailHistory(this.id); } // <-- Sudah ditambahkan

// --- BLOC ---
class EtibiBloc extends Bloc<EtibiEvent, EtibiState> {
  final EtibiRemoteDatasource remoteDatasource;

  EtibiBloc({required this.remoteDatasource}) : super(EtibiState()) {
    on<FetchKota>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final res = await remoteDatasource.getCities();
        emit(state.copyWith(isLoading: false, listKota: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<ChangeKota>((event, emit) async {
      emit(state.copyWith(isLoading: true, selectedKota: event.kota, resetKecamatan: true, resetKelurahan: true));
      try {
        final res = await remoteDatasource.getDistricts(event.kota.id);
        emit(state.copyWith(isLoading: false, listKecamatan: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<ChangeKecamatan>((event, emit) async {
      emit(state.copyWith(isLoading: true, selectedKecamatan: event.kecamatan, resetKelurahan: true));
      try {
        final res = await remoteDatasource.getVillages(event.kecamatan.id);
        emit(state.copyWith(isLoading: false, listKelurahan: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<ChangeKelurahan>((event, emit) {
      emit(state.copyWith(selectedKelurahan: event.kelurahan));
    });

    on<FetchHistory>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final res = await remoteDatasource.getHistoryList();
        emit(state.copyWith(isLoading: false, historyList: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<SubmitEtibiForm>((event, emit) async {
      emit(state.copyWith(isLoading: true, isSuccessSubmit: false, error: null));
      try {
        await remoteDatasource.submitQuestionnaire(event.formData);
        emit(state.copyWith(isLoading: false, isSuccessSubmit: true));
      } catch (e) {
        String errorMsg = "Terjadi kesalahan sistem";
        if (e is DioException && e.response != null) {
          final data = e.response?.data;
          if (data is Map) {
            errorMsg = data['message'] ?? errorMsg;
            if (data['errors'] != null && data['errors'] is List && data['errors'].isNotEmpty) {
              errorMsg = data['errors'][0]['msg'] ?? errorMsg;
            }
          }
        } else {
          errorMsg = e.toString();
        }
        emit(state.copyWith(isLoading: false, error: errorMsg));
      }
    });

    // <-- Event pemanggil detail ditambahkan di sini
    on<FetchDetailHistory>((event, emit) async {
      emit(state.copyWith(isLoading: true, detailData: null, error: null));
      try {
        final res = await remoteDatasource.getQuestionnaireDetail(event.id);
        emit(state.copyWith(isLoading: false, detailData: res));
      } catch (e) { 
        emit(state.copyWith(isLoading: false, error: e.toString())); 
      }
    });

  }
}