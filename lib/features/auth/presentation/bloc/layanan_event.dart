import 'package:equatable/equatable.dart';

abstract class LayananEvent extends Equatable {
  const LayananEvent();

  @override
  List<Object?> get props => [];
}

class ToggleServiceEvent extends LayananEvent {
  final String category;
  final String service;
  final bool selected;

  const ToggleServiceEvent({
    required this.category,
    required this.service,
    required this.selected,
  });

  @override
  List<Object?> get props => [
    category,
    service,
    selected,
  ];
}

class ClearServiceEvent extends LayananEvent {}