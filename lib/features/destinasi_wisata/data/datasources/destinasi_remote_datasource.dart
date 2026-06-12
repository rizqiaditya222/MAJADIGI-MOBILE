import 'package:dio/dio.dart';
import 'package:majadigi/features/destinasi_wisata/domain/entities/destinasi_entity.dart';

abstract class DestinasiRemoteDatasource {
  Future<List<DestinasiEntity>> getDestinations(int page, int limit, String search);
  Future<List<DestinasiEntity>> getPopularDestinations(int page, int limit, String search);
  Future<List<DestinasiEntity>> getNearbyDestinations(int page, int limit, String search, double lat, double lon);
  Future<DestinasiEntity> getDestinationDetail(int id);
}

class DestinasiRemoteDatasourceImpl implements DestinasiRemoteDatasource {
  final Dio dio;
  DestinasiRemoteDatasourceImpl({required this.dio});

  final String basePath = '/api/service/destinasi-wisata';

  @override
  Future<List<DestinasiEntity>> getDestinations(int page, int limit, String search) async {
    // Sudah menggunakan queryParameters agar aman
    final response = await dio.get(
      '$basePath/list-destinasi', 
      queryParameters: {"page": page, "limit": limit, "search": search}
    );
    
    final List data = response.data['data']['data'] ?? [];
    
    // ALAT PENYADAP JSON LIST:
    if (data.isNotEmpty) {
      print("🔍 CEK BENTUK JSON DESTINASI DARI BACKEND: ${data[0]}");
    }
    
    return data.map((e) => DestinasiEntity.fromJson(e)).toList();
  }

  @override
  Future<List<DestinasiEntity>> getPopularDestinations(int page, int limit, String search) async {
    final response = await dio.get(
      '$basePath/list-destinasi-populer', 
      queryParameters: {"page": page, "limit": limit, "search": search}
    );
    final List data = response.data['data']['data'] ?? [];
    return data.map((e) => DestinasiEntity.fromJson(e)).toList();
  }

  @override
  Future<List<DestinasiEntity>> getNearbyDestinations(int page, int limit, String search, double lat, double lon) async {
    final response = await dio.get(
      '$basePath/list-destinasi-terdekat', 
      queryParameters: {"page": page, "limit": limit, "search": search, "latitude": lat, "longitude": lon}
    );
    final List data = response.data['data']['data'] ?? [];
    return data.map((e) => DestinasiEntity.fromJson(e)).toList();
  }

  @override
  Future<DestinasiEntity> getDestinationDetail(int id) async {
    try {
      print("🚀 [Destinasi] MENGIRIM ID DESTINASI: $id");
      
      final response = await dio.request(
        '$basePath/detail-destinasi', 
        // SERANGAN GANDA: Kirim lewat URL dan Body sekaligus!
        queryParameters: {"destination_id": id}, 
        data: {"destination_id": id}, 
        options: Options(method: 'GET', contentType: Headers.jsonContentType),
      );
      
      return DestinasiEntity.fromJson(response.data['date']);
    } on DioException catch (e) {
      print("❌ [Destinasi] ERROR ASLI BACKEND: ${e.response?.data}");
      rethrow;
    }
  }
}