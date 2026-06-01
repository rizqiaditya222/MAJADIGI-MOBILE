import 'package:dio/dio.dart';
import 'package:majadigi/features/daha_husada/domain/entities/daha_husada_entity.dart';

abstract class DahaHusadaRemoteDatasource {
  Future<List<OperasiEntity>> getListOperasi();
  Future<RuanganResponseEntity> getListKamar();
  Future<List<PoliklinikEntity>> getListPoliklinik();
  Future<List<DokterEntity>> getListDokter(String poliId);
  Future<AntrianEntity> getInfoAntrian(String poliId, int doctorId);
}

class DahaHusadaRemoteDatasourceImpl implements DahaHusadaRemoteDatasource {
  final Dio dio;

  DahaHusadaRemoteDatasourceImpl({required this.dio});

  final String basePath = '/api/service/rsud/daha-husada';

  @override
  Future<List<OperasiEntity>> getListOperasi() async {
    try {
      final response = await dio.get('$basePath/list-operasi');
      if (response.statusCode == 200) {
        final List data = response.data['data'] ?? [];
        return data.map((e) => OperasiEntity.fromJson(e)).toList();
      }
      throw DioException(requestOptions: response.requestOptions, response: response);
    } catch (e) { rethrow; }
  }

  @override
  Future<RuanganResponseEntity> getListKamar() async {
    try {
      final response = await dio.get('$basePath/list-kamar-rawat');
      if (response.statusCode == 200) {
        final summaryData = response.data['data']['summary'] ?? {};
        final List roomsData = response.data['data']['rooms'] ?? [];
        return RuanganResponseEntity(
          summary: RuanganSummaryEntity.fromJson(summaryData),
          rooms: roomsData.map((e) => RuanganItemEntity.fromJson(e)).toList(),
        );
      }
      throw DioException(requestOptions: response.requestOptions, response: response);
    } catch (e) { rethrow; }
  }

  @override
  Future<List<PoliklinikEntity>> getListPoliklinik() async {
    try {
      final response = await dio.get('$basePath/list-poliklinik');
      if (response.statusCode == 200) {
        final List data = response.data['data'] ?? [];
        return data.map((e) => PoliklinikEntity.fromJson(e)).toList();
      }
      throw DioException(requestOptions: response.requestOptions, response: response);
    } catch (e) { rethrow; }
  }

  @override
  Future<List<DokterEntity>> getListDokter(String poliId) async {
    try {
      final response = await dio.get(
        '$basePath/list-dokter',
        data: { "polychlinic_id": poliId },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        final List data = response.data['data'] ?? [];
        return data.map((e) => DokterEntity.fromJson(e)).toList();
      }
      throw DioException(requestOptions: response.requestOptions, response: response);
    } catch (e) { rethrow; }
  }

  @override
  Future<AntrianEntity> getInfoAntrian(String poliId, int doctorId) async {
    try {
      final response = await dio.get(
        '$basePath/info-antrian',
        data: { "polychlinic_id": poliId, "doctor_id": doctorId },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200) {
        return AntrianEntity.fromJson(response.data['data']);
      }
      throw DioException(requestOptions: response.requestOptions, response: response);
    } catch (e) { rethrow; }
  }
}