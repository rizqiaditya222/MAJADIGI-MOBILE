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
    // Jika amount null (saat klik Lihat Semua), kita "tipu" backend 
    // dengan mengirim angka besar agar error 400 tidak terpancing.
    final response = await dio.get(
      '$basePath/list-rute', 
      data: {"amount": amount ?? 999}, 
    );
    final List data = response.data['data'] ?? [];
    return data.map((e) => TransjatimRouteEntity.fromJson(e)).toList();
  }
  @override
  Future<TransjatimRouteEntity> getRouteDetail(int routeId) async {
    // Backend meminta parameter `route_id` dikirim di body
    final response = await dio.get('$basePath/detail-rute', data: {"route_id": routeId});
    return TransjatimRouteEntity.fromJson(response.data['data']);
  }
}