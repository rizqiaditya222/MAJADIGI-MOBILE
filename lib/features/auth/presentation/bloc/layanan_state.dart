import 'package:equatable/equatable.dart';
import '../../domain/entities/selected_service.dart';

class LayananState extends Equatable {
  final List<SelectedService> services;

  const LayananState({
    this.services = const [],
  });

  LayananState copyWith({
    List<SelectedService>? services,
  }) {
    return LayananState(
      services: services ?? this.services,
    );
  }

  @override
  List<Object?> get props => [services];
}