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

  // Sesuaikan dengan endpoint base path Express-mu
  final String basePath = '/api/service/destinasi-wisata';

  @override
  Future<List<DestinasiEntity>> getDestinations(int page, int limit, String search) async {
    final response = await dio.get('$basePath/list-destinasi', data: {"page": page, "limit": limit, "search": search});
    final List data = response.data['data']['data'] ?? [];
    return data.map((e) => DestinasiEntity.fromJson(e)).toList();
  }

  @override
  Future<List<DestinasiEntity>> getPopularDestinations(int page, int limit, String search) async {
    final response = await dio.get('$basePath/list-destinasi-populer', data: {"page": page, "limit": limit, "search": search});
    final List data = response.data['data']['data'] ?? [];
    return data.map((e) => DestinasiEntity.fromJson(e)).toList();
  }

  @override
  Future<List<DestinasiEntity>> getNearbyDestinations(int page, int limit, String search, double lat, double lon) async {
    // Memerlukan parameter wajib: latitude & longitude
    final response = await dio.get('$basePath/list-destinasi-terdekat', data: {"page": page, "limit": limit, "search": search, "latitude": lat, "longitude": lon});
    final List data = response.data['data']['data'] ?? [];
    return data.map((e) => DestinasiEntity.fromJson(e)).toList();
  }

  @override
  Future<DestinasiEntity> getDestinationDetail(int id) async {
    final response = await dio.get('$basePath/detail-destinasi', data: {"destination_id": id});
    // Menyesuaikan typo di backend (menggunakan key 'date' alih-alih 'data')
    return DestinasiEntity.fromJson(response.data['date']);
  }
}