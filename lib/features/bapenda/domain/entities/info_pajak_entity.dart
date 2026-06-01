class FeeItemEntity {
  final String annotation;
  final int value;

  FeeItemEntity({required this.annotation, required this.value});

  factory FeeItemEntity.fromJson(Map<String, dynamic> json) {
    return FeeItemEntity(
      annotation: json['annotation'] ?? '',
      value: (json['value'] ?? 0).toInt(),
    );
  }
}

class InfoPajakEntity {
  final String brand;
  final String licensePlateNumber;
  final String color;
  final String model;
  final String year;
  final String taxPeriod;
  final List<FeeItemEntity> annualFees;
  final List<FeeItemEntity> fiveYearFees;
  final int totalPajak;

  InfoPajakEntity({
    required this.brand, required this.licensePlateNumber, required this.color,
    required this.model, required this.year, required this.taxPeriod,
    required this.annualFees, required this.fiveYearFees, required this.totalPajak,
  });

  factory InfoPajakEntity.fromJson(Map<String, dynamic> json) {
    final annual = (json['annual_fees'] as List?)?.map((e) => FeeItemEntity.fromJson(e)).toList() ?? [];
    final fiveYear = (json['five_year_fees'] as List?)?.map((e) => FeeItemEntity.fromJson(e)).toList() ?? [];
    
    final total = annual.fold(0, (sum, item) => sum + item.value);

    return InfoPajakEntity(
      brand: json['brand'] ?? '',
      licensePlateNumber: json['license_plate_number'] ?? '',
      color: json['color'] ?? '',
      model: json['model'] ?? '',
      year: json['year'] ?? '',
      taxPeriod: json['tax_period'] ?? '',
      annualFees: annual,
      fiveYearFees: fiveYear,
      totalPajak: total,
    );
  }
}