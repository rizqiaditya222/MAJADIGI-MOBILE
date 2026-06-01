import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majadigi/features/bapenda/domain/entities/njkb_entity.dart';
import 'package:majadigi/features/bapenda/data/datasources/njkb_remote_datasource.dart';

class NjkbState {
  final bool isLoading;
  final String? error;
  
  final List<NjkbDropdownEntity> listJenis;
  final List<NjkbDropdownEntity> listModel;
  final List<NjkbDropdownEntity> listMerk;
  final List<NjkbDropdownEntity> listTipe;
  final List<NjkbDropdownEntity> listTahun;

  final NjkbDropdownEntity? selectedJenis;
  final NjkbDropdownEntity? selectedModel;
  final NjkbDropdownEntity? selectedMerk;
  final NjkbDropdownEntity? selectedTipe;
  final NjkbDropdownEntity? selectedTahun;

  final NjkbResultEntity? resultData;

  NjkbState({
    this.isLoading = false, this.error,
    this.listJenis = const [], this.listModel = const [], this.listMerk = const [], this.listTipe = const [], this.listTahun = const [],
    this.selectedJenis, this.selectedModel, this.selectedMerk, this.selectedTipe, this.selectedTahun,
    this.resultData,
  });

  NjkbState copyWith({
    bool? isLoading, String? error,
    List<NjkbDropdownEntity>? listJenis, List<NjkbDropdownEntity>? listModel, List<NjkbDropdownEntity>? listMerk, List<NjkbDropdownEntity>? listTipe, List<NjkbDropdownEntity>? listTahun,
    NjkbDropdownEntity? selectedJenis, NjkbDropdownEntity? selectedModel, NjkbDropdownEntity? selectedMerk, NjkbDropdownEntity? selectedTipe, NjkbDropdownEntity? selectedTahun,
    NjkbResultEntity? resultData,
    
    bool resetModel = false,
    bool resetMerk = false,
    bool resetTipe = false,
    bool resetTahun = false,
    bool clearResult = false, // Tambahan baru untuk menghapus memori hasil pencarian
  }) {
    return NjkbState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      listJenis: listJenis ?? this.listJenis,
      listModel: resetModel ? [] : (listModel ?? this.listModel),
      listMerk: resetMerk ? [] : (listMerk ?? this.listMerk),
      listTipe: resetTipe ? [] : (listTipe ?? this.listTipe),
      listTahun: resetTahun ? [] : (listTahun ?? this.listTahun),
      
      selectedJenis: selectedJenis ?? this.selectedJenis,
      selectedModel: resetModel ? null : (selectedModel ?? this.selectedModel),
      selectedMerk: resetMerk ? null : (selectedMerk ?? this.selectedMerk),
      selectedTipe: resetTipe ? null : (selectedTipe ?? this.selectedTipe),
      selectedTahun: resetTahun ? null : (selectedTahun ?? this.selectedTahun),
      
      // Jika clearResult true, kosongkan memori data yang lama
      resultData: clearResult ? null : (resultData ?? this.resultData),
    );
  }
}

abstract class NjkbEvent {}
class FetchJenis extends NjkbEvent {}
class ChangeJenis extends NjkbEvent { final NjkbDropdownEntity data; ChangeJenis(this.data); }
class ChangeModel extends NjkbEvent { final NjkbDropdownEntity data; ChangeModel(this.data); }
class ChangeMerk extends NjkbEvent { final NjkbDropdownEntity data; ChangeMerk(this.data); }
class ChangeTipe extends NjkbEvent { final NjkbDropdownEntity data; ChangeTipe(this.data); }
class ChangeTahun extends NjkbEvent { final NjkbDropdownEntity data; ChangeTahun(this.data); }
class SubmitNjkb extends NjkbEvent {}

class NjkbBloc extends Bloc<NjkbEvent, NjkbState> {
  final NjkbRemoteDatasource remoteDatasource;

  NjkbBloc({required this.remoteDatasource}) : super(NjkbState()) {
    
    on<FetchJenis>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final res = await remoteDatasource.getListJenis();
        emit(state.copyWith(isLoading: false, listJenis: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<ChangeJenis>((event, emit) async {
      emit(state.copyWith(isLoading: true, selectedJenis: event.data, resetModel: true, resetMerk: true, resetTipe: true, resetTahun: true, clearResult: true));
      try {
        final res = await remoteDatasource.getListModel(event.data.id);
        emit(state.copyWith(isLoading: false, listModel: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<ChangeModel>((event, emit) async {
      emit(state.copyWith(isLoading: true, selectedModel: event.data, resetMerk: true, resetTipe: true, resetTahun: true, clearResult: true));
      try {
        final res = await remoteDatasource.getListMerk(event.data.id);
        emit(state.copyWith(isLoading: false, listMerk: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<ChangeMerk>((event, emit) async {
      emit(state.copyWith(isLoading: true, selectedMerk: event.data, resetTipe: true, resetTahun: true, clearResult: true));
      try {
        final res = await remoteDatasource.getListTipe(event.data.id);
        emit(state.copyWith(isLoading: false, listTipe: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<ChangeTipe>((event, emit) async {
      emit(state.copyWith(isLoading: true, selectedTipe: event.data, resetTahun: true, clearResult: true));
      try {
        final res = await remoteDatasource.getListTahun(event.data.id);
        emit(state.copyWith(isLoading: false, listTahun: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<ChangeTahun>((event, emit) {
      // Saat tahun diubah pun, hapus hasil pencarian yang lama agar tidak nyangkut
      emit(state.copyWith(selectedTahun: event.data, clearResult: true));
    });

    on<SubmitNjkb>((event, emit) async {
      if (state.selectedTahun == null) return;
      // Clear result sekali lagi sebelum menarik data baru, sekadar berjaga-jaga
      emit(state.copyWith(isLoading: true, clearResult: true));
      try {
        final res = await remoteDatasource.getInfoNjkb(state.selectedTahun!.id);
        emit(state.copyWith(isLoading: false, resultData: res));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });
  }
}