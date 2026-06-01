class OperasiEntity {
  final String surgeryName;
  final String surgeonName;
  final String polychlinicName;
  final String date;

  OperasiEntity({required this.surgeryName, required this.surgeonName, required this.polychlinicName, required this.date});

  factory OperasiEntity.fromJson(Map<String, dynamic> json) {
    return OperasiEntity(
      surgeryName: json['surgery_name'] ?? '',
      surgeonName: json['surgeon_name'] ?? '',
      polychlinicName: json['polychlinic_name'] ?? '',
      date: json['date'] ?? '',
    );
  }
}

class PoliklinikEntity {
  final String id;
  final String name;

  PoliklinikEntity({required this.id, required this.name});

  factory PoliklinikEntity.fromJson(Map<String, dynamic> json) {
    return PoliklinikEntity(
      id: json['polychlinic_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class DokterEntity {
  final int id;
  final String name;

  DokterEntity({required this.id, required this.name});

  factory DokterEntity.fromJson(Map<String, dynamic> json) {
    return DokterEntity(
      id: json['doctor_id'] ?? 0,
      name: json['doctor_name'] ?? '',
    );
  }
}

class RuanganSummaryEntity {
  final int total;
  final int occupied;
  final int available;

  RuanganSummaryEntity({required this.total, required this.occupied, required this.available});

  factory RuanganSummaryEntity.fromJson(Map<String, dynamic> json) {
    return RuanganSummaryEntity(
      total: json['total'] ?? 0,
      occupied: json['occupied'] ?? 0,
      available: json['available'] ?? 0,
    );
  }
}

class RuanganItemEntity {
  final String name;
  final String type;
  final int total;
  final int occupied;
  final int available;

  RuanganItemEntity({required this.name, required this.type, required this.total, required this.occupied, required this.available});

  factory RuanganItemEntity.fromJson(Map<String, dynamic> json) {
    return RuanganItemEntity(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      total: json['total'] ?? 0,
      occupied: json['occupied'] ?? 0,
      available: json['available'] ?? 0,
    );
  }
}

class RuanganResponseEntity {
  final RuanganSummaryEntity summary;
  final List<RuanganItemEntity> rooms;

  RuanganResponseEntity({required this.summary, required this.rooms});
}

class AntrianEntity {
  final int dailyCapacity;
  final int totalQueue;
  final int served;
  final int queueNumber;
  final String date;
  final String polychlinicName;
  final String doctorName;
  final String practiceTime;

  AntrianEntity({
    required this.dailyCapacity, required this.totalQueue, required this.served,
    required this.queueNumber, required this.date, required this.polychlinicName,
    required this.doctorName, required this.practiceTime,
  });

  factory AntrianEntity.fromJson(Map<String, dynamic> json) {
    return AntrianEntity(
      dailyCapacity: json['daily_capacity'] ?? 0,
      totalQueue: json['total_queue'] ?? 0,
      served: json['served'] ?? 0,
      queueNumber: json['queue_number'] ?? 0,
      date: json['date'] ?? '',
      polychlinicName: json['polychlinic_name'] ?? '',
      doctorName: json['doctor_name'] ?? '',
      practiceTime: json['practice_time'] ?? '',
    );
  }
}