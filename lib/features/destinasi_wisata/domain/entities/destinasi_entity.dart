class DestinasiEntity {
  final int id;
  final String name;
  final String location;
  final String? description;
  final String? gmapsUrl;
  final String? imageUrl;
  final double latitude;
  final double longitude;
  final int reviewCount;
  final double? distance; // Muncul saat menembak API Nearby

  DestinasiEntity({
    required this.id, required this.name, required this.location,
    this.description, this.gmapsUrl, this.imageUrl,
    required this.latitude, required this.longitude,
    required this.reviewCount, this.distance,
  });

  factory DestinasiEntity.fromJson(Map<String, dynamic> json) {
    return DestinasiEntity(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      description: json['description'],
      gmapsUrl: json['gmaps_url'],
      imageUrl: json['image_url'],
      latitude: double.tryParse(json['latitude']?.toString() ?? '0') ?? 0,
      longitude: double.tryParse(json['longitude']?.toString() ?? '0') ?? 0,
      reviewCount: json['review_count'] ?? 0,
      distance: json['distance'] != null ? double.tryParse(json['distance'].toString()) : null,
    );
  }
}