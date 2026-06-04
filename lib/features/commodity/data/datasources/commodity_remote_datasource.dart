import 'package:dio/dio.dart';
import 'package:majadigi/features/commodity/domain/entities/commodity_entity.dart';

abstract class CommodityRemoteDatasource {
  Future<List<CommodityEntity>> getCommodities({int page = 1, String search = ''});
  Future<CommodityDetailEntity> getCommodityDetail(int id);
}

class CommodityRemoteDatasourceImpl implements CommodityRemoteDatasource {
  final Dio dio;

  CommodityRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<CommodityEntity>> getCommodities({int page = 1, String search = ''}) async {
    try {
      final response = await dio.get(
        '/api/service/harga-bahan-pokok/commodities',
        data: {
          // Tanggal kita hapus agar backend otomatis memakai tanggal hari ini
          "search": search,
          "page": page,
          "limit": 100 // Minta 100 data sekaligus agar UI Flutter bisa membaginya jadi beberapa halaman (slide)
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data['data'] ?? {};
        final List listData = responseData['data'] ?? [];
        return listData.map((json) => CommodityEntity.fromJson(json)).toList();
      } else {
        throw DioException(requestOptions: response.requestOptions, response: response);
      }
    } catch (e) {
      print('❌ [Commodity Remote] Error GET List: $e');
      rethrow;
    }
  }

  @override
  Future<CommodityDetailEntity> getCommodityDetail(int id) async {
    try {
      final response = await dio.get(
        '/api/service/harga-bahan-pokok/commodity-detail',
        data: {
          "id": id
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> detailData = response.data['data']['data'] ?? {};
        return CommodityDetailEntity.fromJson(detailData);
      } else {
        throw DioException(requestOptions: response.requestOptions, response: response);
      }
    } catch (e) {
      print('❌ [Commodity Remote] Error GET Detail: $e');
      rethrow;
    }
  }
}