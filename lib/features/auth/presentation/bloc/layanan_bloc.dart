import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/selected_service.dart';
import 'layanan_event.dart';
import 'layanan_state.dart';

class LayananBloc
    extends Bloc<LayananEvent, LayananState> {
  LayananBloc() : super(const LayananState()) {
    on<ToggleServiceEvent>(_toggleService);
    on<ClearServiceEvent>(_clear);
  }

  void _toggleService(
      ToggleServiceEvent event,
      Emitter<LayananState> emit,
      ) {
    final services =
    List<SelectedService>.from(state.services);

    final item = SelectedService(
      category: event.category,
      service: event.service,
    );

    if (event.selected) {
      if (!services.contains(item)) {
        services.add(item);
      }
    } else {
      services.remove(item);
    }

    emit(
      state.copyWith(
        services: services,
      ),
    );
  }

  void _clear(
      ClearServiceEvent event,
      Emitter<LayananState> emit,
      ) {
    emit(
      state.copyWith(
        services: [],
      ),
    );
  }
}