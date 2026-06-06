import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majadigi/features/transjatim/data/datasources/transjatim_remote_datasource.dart';
import 'package:majadigi/features/transjatim/domain/entities/transjatim_entity.dart';

// --- STATE ---
class TransjatimState {
  final bool isLoading;
  final String? error;
  
  final List<TransjatimTicketEntity> homeTickets;
  final List<TransjatimRouteEntity> homeRoutes;
  final TransjatimAllTicketEntity? allTickets;
  final List<TransjatimRouteEntity> allRoutes;
  final TransjatimRouteEntity? routeDetail;

  TransjatimState({
    this.isLoading = false, this.error,
    this.homeTickets = const [], this.homeRoutes = const [],
    this.allTickets, this.allRoutes = const [], this.routeDetail,
  });

  TransjatimState copyWith({
    bool? isLoading, String? error,
    List<TransjatimTicketEntity>? homeTickets, List<TransjatimRouteEntity>? homeRoutes,
    TransjatimAllTicketEntity? allTickets, List<TransjatimRouteEntity>? allRoutes,
    TransjatimRouteEntity? routeDetail,
    bool clearError = false,
  }) {
    return TransjatimState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      homeTickets: homeTickets ?? this.homeTickets,
      homeRoutes: homeRoutes ?? this.homeRoutes,
      allTickets: allTickets ?? this.allTickets,
      allRoutes: allRoutes ?? this.allRoutes,
      routeDetail: routeDetail ?? this.routeDetail,
    );
  }
}

// --- EVENTS ---
abstract class TransjatimEvent {}
class FetchHomeData extends TransjatimEvent {}
class FetchAllTickets extends TransjatimEvent {}
class FetchAllRoutes extends TransjatimEvent {}
class FetchRouteDetail extends TransjatimEvent { final int routeId; FetchRouteDetail(this.routeId); }

// --- BLOC ---
class TransjatimBloc extends Bloc<TransjatimEvent, TransjatimState> {
  final TransjatimRemoteDatasource remoteDatasource;

  TransjatimBloc({required this.remoteDatasource}) : super(TransjatimState()) {
    
    on<FetchHomeData>((event, emit) async {
      emit(state.copyWith(isLoading: true, clearError: true));
      try {
        final tickets = await remoteDatasource.getTicketList();
        // Mengambil hanya 3 rute untuk layar Home (Home Page)
        final routes = await remoteDatasource.getRouteList(amount: 3); 
        emit(state.copyWith(isLoading: false, homeTickets: tickets, homeRoutes: routes));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<FetchAllTickets>((event, emit) async {
      emit(state.copyWith(isLoading: true, clearError: true));
      try {
        final tickets = await remoteDatasource.getAllTicketList();
        emit(state.copyWith(isLoading: false, allTickets: tickets));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<FetchAllRoutes>((event, emit) async {
      emit(state.copyWith(isLoading: true, clearError: true));
      try {
        // Tanpa parameter `amount` agar mengambil semua rute
        final routes = await remoteDatasource.getRouteList(); 
        emit(state.copyWith(isLoading: false, allRoutes: routes));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });

    on<FetchRouteDetail>((event, emit) async {
      emit(state.copyWith(isLoading: true, clearError: true, routeDetail: null)); // Reset detail sebelumnya
      try {
        final detail = await remoteDatasource.getRouteDetail(event.routeId);
        emit(state.copyWith(isLoading: false, routeDetail: detail));
      } catch (e) { emit(state.copyWith(isLoading: false, error: e.toString())); }
    });
  }
}