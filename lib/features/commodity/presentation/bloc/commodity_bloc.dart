import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/commodity_entity.dart';
import '../../data/datasources/commodity_remote_datasource.dart';

// --- STATE ---
abstract class CommodityState {}
class CommodityInitial extends CommodityState {}
class CommodityLoading extends CommodityState {}
class CommodityLoaded extends CommodityState {
  final List<CommodityEntity> commodities;
  CommodityLoaded(this.commodities);
}
// ✅ Tambahan State untuk Detail
class CommodityDetailLoaded extends CommodityState {
  final CommodityDetailEntity detail;
  CommodityDetailLoaded(this.detail);
}
class CommodityError extends CommodityState {
  final String message;
  CommodityError(this.message);
}

// --- EVENT ---
abstract class CommodityEvent {}
class FetchCommodities extends CommodityEvent {}
// ✅ Tambahan Event untuk Detail
class FetchCommodityDetail extends CommodityEvent {
  final int id;
  FetchCommodityDetail(this.id);
}

// --- BLOC ---
class CommodityBloc extends Bloc<CommodityEvent, CommodityState> {
  final CommodityRemoteDatasource remoteDatasource;

  CommodityBloc({required this.remoteDatasource}) : super(CommodityInitial()) {
    on<FetchCommodities>((event, emit) async {
      emit(CommodityLoading());
      try {
        final data = await remoteDatasource.getCommodities(page: 1);
        emit(CommodityLoaded(data));
      } catch (e) {
        emit(CommodityError(e.toString()));
      }
    });

    // ✅ Handler untuk Detail
    on<FetchCommodityDetail>((event, emit) async {
      emit(CommodityLoading());
      try {
        final data = await remoteDatasource.getCommodityDetail(event.id);
        emit(CommodityDetailLoaded(data));
      } catch (e) {
        emit(CommodityError(e.toString()));
      }
    });
  }
}