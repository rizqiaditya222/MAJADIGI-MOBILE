class TransjatimTicketEntity {
  final String name;
  final int price;

  TransjatimTicketEntity({required this.name, required this.price});

  factory TransjatimTicketEntity.fromJson(Map<String, dynamic> json) {
    return TransjatimTicketEntity(
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
    );
  }
}

class TransjatimAllTicketEntity {
  final List<TransjatimTicketEntity> umum;
  final List<TransjatimTicketEntity> luxury;

  TransjatimAllTicketEntity({required this.umum, required this.luxury});

  factory TransjatimAllTicketEntity.fromJson(Map<String, dynamic> json) {
    return TransjatimAllTicketEntity(
      umum: (json['umum'] as List?)?.map((e) => TransjatimTicketEntity.fromJson(e)).toList() ?? [],
      luxury: (json['luxury'] as List?)?.map((e) => TransjatimTicketEntity.fromJson(e)).toList() ?? [],
    );
  }
}

class TransjatimStopEntity {
  final String name;
  final String color;
  final double latitude;
  final double longitude;

  TransjatimStopEntity({required this.name, required this.color, required this.latitude, required this.longitude});

  factory TransjatimStopEntity.fromJson(Map<String, dynamic> json) {
    return TransjatimStopEntity(
      name: json['name'] ?? '',
      color: json['color'] ?? '',
      latitude: double.tryParse(json['latitude']?.toString() ?? '0') ?? 0,
      longitude: double.tryParse(json['longitude']?.toString() ?? '0') ?? 0,
    );
  }
}

class TransjatimRouteEntity {
  final int? id; 
  final String corridorName;
  final String corridorColor;
  final List<String> destinations;
  final String operatingTime;
  final String serviceName;
  final int price;
  final List<TransjatimStopEntity>? stops;

  TransjatimRouteEntity({
    this.id, required this.corridorName, required this.corridorColor,
    required this.destinations, required this.operatingTime,
    required this.serviceName, required this.price, this.stops,
  });

  factory TransjatimRouteEntity.fromJson(Map<String, dynamic> json) {
    return TransjatimRouteEntity(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      corridorName: json['corridor']?['name'] ?? '',
      corridorColor: json['corridor']?['color'] ?? '',
      destinations: List<String>.from(json['destinations'] ?? []),
      operatingTime: json['operating_time'] ?? '',
      serviceName: json['service_name'] ?? '',
      price: json['price'] ?? 0,
      stops: json['stops'] != null ? (json['stops'] as List).map((e) => TransjatimStopEntity.fromJson(e)).toList() : null,
    );
  }
}