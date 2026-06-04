class KarsaHusadaRoomEntity {
  final String name;
  final String type;
  final int total;
  final int occupied;
  final int available;

  KarsaHusadaRoomEntity({
    required this.name,
    required this.type,
    required this.total,
    required this.occupied,
    required this.available,
  });

  factory KarsaHusadaRoomEntity.fromJson(Map<String, dynamic> json) {
    return KarsaHusadaRoomEntity(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      total: json['total'] ?? 0,
      occupied: json['occupied'] ?? 0,
      available: json['available'] ?? 0,
    );
  }
}

class KarsaHusadaSummaryEntity {
  final int total;
  final int occupied;
  final int available;
  final String lastUpdate;

  KarsaHusadaSummaryEntity({
    required this.total,
    required this.occupied,
    required this.available,
    required this.lastUpdate,
  });

  factory KarsaHusadaSummaryEntity.fromJson(Map<String, dynamic> json) {
    return KarsaHusadaSummaryEntity(
      total: json['total'] ?? 0,
      occupied: json['occupied'] ?? 0,
      available: json['available'] ?? 0,
      lastUpdate: json['last_update'] ?? '',
    );
  }
}

class KarsaHusadaResponseEntity {
  final KarsaHusadaSummaryEntity summary;
  final List<KarsaHusadaRoomEntity> rooms;

  KarsaHusadaResponseEntity({required this.summary, required this.rooms});

  factory KarsaHusadaResponseEntity.fromJson(Map<String, dynamic> json) {
    final roomsList = (json['rooms'] as List?)?.map((e) => KarsaHusadaRoomEntity.fromJson(e)).toList() ?? [];
    return KarsaHusadaResponseEntity(
      summary: KarsaHusadaSummaryEntity.fromJson(json['summary'] ?? {}),
      rooms: roomsList,
    );
  }
}