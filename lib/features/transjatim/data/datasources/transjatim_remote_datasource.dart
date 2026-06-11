import 'package:dio/dio.dart';
import 'package:majadigi/features/transjatim/domain/entities/transjatim_entity.dart';

abstract class TransjatimRemoteDatasource {
  Future<List<TransjatimTicketEntity>> getTicketList();
  Future<TransjatimAllTicketEntity> getAllTicketList();
  Future<List<TransjatimRouteEntity>> getRouteList({int? amount});
  Future<TransjatimRouteEntity> getRouteDetail(int routeId);
}

class TransjatimRemoteDatasourceImpl implements TransjatimRemoteDatasource {
  final Dio dio;
  TransjatimRemoteDatasourceImpl({required this.dio});

  final String basePath = '/api/service/transjatim';

  @override
  Future<List<TransjatimTicketEntity>> getTicketList() async {
    final response = await dio.get('$basePath/list-tiket');
    final List data = response.data['data'] ?? [];
    return data.map((e) => TransjatimTicketEntity.fromJson(e)).toList();
  }

  @override
  Future<TransjatimAllTicketEntity> getAllTicketList() async {
    final response = await dio.get('$basePath/list-semua-tiket');
    return TransjatimAllTicketEntity.fromJson(response.data['data']);
  }

  @override
  Future<List<TransjatimRouteEntity>> getRouteList({int? amount}) async {
    final response = await dio.get(
      '$basePath/list-rute', 
      data: {"amount": amount ?? 999}, 
    );
    final List data = response.data['data'] ?? [];
    return data.map((e) => TransjatimRouteEntity.fromJson(e)).toList();
  }
  @override
  Future<TransjatimRouteEntity> getRouteDetail(int routeId) async {
    try {
      print("🚀 [TransJatim] MENGIRIM ID RUTE: $routeId");
      
      final response = await dio.request(
        '$basePath/detail-rute', 
        // SERANGAN GANDA: Kirim lewat URL dan Body sekaligus!
        queryParameters: {"route_id": routeId}, 
        data: {"route_id": routeId},
        options: Options(method: 'GET', contentType: Headers.jsonContentType),
      );
      
      return TransjatimRouteEntity.fromJson(response.data['data']);
    } on DioException catch (e) {
      // ALAT PENYADAP: Melihat pesan asli dari backend
      print("❌ [TransJatim] ERROR ASLI BACKEND: ${e.response?.data}");
      rethrow;
    }
  }
}