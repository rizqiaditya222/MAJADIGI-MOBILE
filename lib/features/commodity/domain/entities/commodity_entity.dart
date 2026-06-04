class CommodityEntity {
  final int id;
  final String name;
  final double averagePrice;
  final String status;

  CommodityEntity({
    required this.id,
    required this.name,
    required this.averagePrice,
    required this.status,
  });

  factory CommodityEntity.fromJson(Map<String, dynamic> json) {
    return CommodityEntity(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      averagePrice: (json['average_price'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? 'sama',
    );
  }

  bool get isUp => status.toLowerCase() == 'naik';
}

class CommodityDetailEntity {
  final double averagePrice;
  final String status;
  final List<PriceHistoryEntity> priceHistory;
  final List<CityPriceEntity> cityPrices;

  CommodityDetailEntity({
    required this.averagePrice,
    required this.status,
    required this.priceHistory,
    required this.cityPrices,
  });

  factory CommodityDetailEntity.fromJson(Map<String, dynamic> json) {
    var historyList = (json['price_history'] as List?) ?? [];
    var cityList = (json['average_price_by_city'] as List?) ?? [];

    return CommodityDetailEntity(
      averagePrice: (json['average_price'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? 'sama',
      priceHistory: historyList.map((e) => PriceHistoryEntity.fromJson(e)).toList(),
      cityPrices: cityList.map((e) => CityPriceEntity.fromJson(e)).toList(),
    );
  }
}

class PriceHistoryEntity {
  final double averagePrice;
  final String date;

  PriceHistoryEntity({required this.averagePrice, required this.date});

  factory PriceHistoryEntity.fromJson(Map<String, dynamic> json) {
    return PriceHistoryEntity(
      averagePrice: (json['average_price'] as num?)?.toDouble() ?? 0.0,
      date: json['date'] ?? '',
    );
  }
}

class CityPriceEntity {
  final String city;
  final double price;
  final String status;

  CityPriceEntity({required this.city, required this.price, required this.status});

  factory CityPriceEntity.fromJson(Map<String, dynamic> json) {
    return CityPriceEntity(
      city: json['city'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? 'sama',
    );
  }

  bool get isUp => status.toLowerCase() == 'naik';
}