import 'package:dio/dio.dart';
import 'package:majadigi/features/bapenda/domain/entities/njkb_entity.dart';

abstract class NjkbRemoteDatasource {
  Future<List<NjkbDropdownEntity>> getListJenis();
  Future<List<NjkbDropdownEntity>> getListModel(int id);
  Future<List<NjkbDropdownEntity>> getListMerk(int id);
  Future<List<NjkbDropdownEntity>> getListTipe(int id);
  Future<List<NjkbDropdownEntity>> getListTahun(int id);
  Future<NjkbResultEntity> getInfoNjkb(int yearId);
}

class NjkbRemoteDatasourceImpl implements NjkbRemoteDatasource {
  final Dio dio;
  
  NjkbRemoteDatasourceImpl({required this.dio});

  final String basePath = '/api/service/bapenda/njkb';

  Future<List<NjkbDropdownEntity>> _fetchList(String endpoint, String nameKey, {int? id}) async {
    try {
      final response = await dio.get(
        '$basePath$endpoint',
        data: id != null ? {"id": id} : null,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      
      if (response.statusCode == 200) {
        final responseData = response.data['data'];
        final List listData = responseData != null ? (responseData['data'] ?? []) : [];
        return listData.map((e) => NjkbDropdownEntity.fromJson(e, nameKey)).toList();
      }
      
      throw DioException(requestOptions: response.requestOptions, response: response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<NjkbDropdownEntity>> getListJenis() => _fetchList('/list-jenis-kendaraan', 'style_name');

  @override
  Future<List<NjkbDropdownEntity>> getListModel(int id) => _fetchList('/list-model-kendaraan', 'style_variant_name', id: id);

  @override
  Future<List<NjkbDropdownEntity>> getListMerk(int id) => _fetchList('/list-merk-kendaraan', 'brand_name', id: id);

  @override
  Future<List<NjkbDropdownEntity>> getListTipe(int id) => _fetchList('/list-tipe-kendaraan', 'model_code', id: id);

  @override
  Future<List<NjkbDropdownEntity>> getListTahun(int id) => _fetchList('/list-tahun-kendaraan', 'year', id: id);

  @override
  Future<NjkbResultEntity> getInfoNjkb(int yearId) async {
    try {
      final response = await dio.get(
        '$basePath/info-nilai-jual',
        data: {"id": yearId},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      
      if (response.statusCode == 200) {
        return NjkbResultEntity.fromJson(response.data['data']);
      }
      
      throw DioException(requestOptions: response.requestOptions, response: response);
    } catch (e) {
      rethrow;
    }
  }
}