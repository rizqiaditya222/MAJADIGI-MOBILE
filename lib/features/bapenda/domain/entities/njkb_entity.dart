class NjkbDropdownEntity {
  final int id;
  final String name;

  NjkbDropdownEntity({required this.id, required this.name});

  factory NjkbDropdownEntity.fromJson(Map<String, dynamic> json, String nameKey) {
    return NjkbDropdownEntity(
      id: json['id'] ?? 0,
      name: json[nameKey] ?? json['year'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NjkbDropdownEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class NjkbFeeItem {
  final String annotation;
  final int value;

  NjkbFeeItem({required this.annotation, required this.value});

  factory NjkbFeeItem.fromJson(Map<String, dynamic> json) {
    return NjkbFeeItem(
      annotation: json['annotation'] ?? '',
      value: (json['value'] ?? 0).toInt(),
    );
  }
}

class NjkbResultEntity {
  final String brand;
  final String year;
  final String typeCode;
  final List<NjkbFeeItem> details;
  final List<NjkbFeeItem> pnbp;

  NjkbResultEntity({
    required this.brand,
    required this.year,
    required this.typeCode,
    required this.details,
    required this.pnbp,
  });

  factory NjkbResultEntity.fromJson(Map<String, dynamic> json) {
    final detailsList = (json['details'] as List?)?.map((e) => NjkbFeeItem.fromJson(e)).toList() ?? [];
    final pnbpList = (json['pnbp'] as List?)?.map((e) => NjkbFeeItem.fromJson(e)).toList() ?? [];

    return NjkbResultEntity(
      brand: json['brand'] ?? '',
      year: json['year']?.toString() ?? '',
      typeCode: json['type_code'] ?? '',
      details: detailsList,
      pnbp: pnbpList,
    );
  }
}