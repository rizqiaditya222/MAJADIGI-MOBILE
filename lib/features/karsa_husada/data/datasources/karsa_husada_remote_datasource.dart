import 'package:dio/dio.dart';
import 'package:majadigi/features/karsa_husada/domain/entities/karsa_husada_entity.dart';

abstract class KarsaHusadaRemoteDatasource {
  Future<KarsaHusadaResponseEntity> getListKamar();
}

class KarsaHusadaRemoteDatasourceImpl implements KarsaHusadaRemoteDatasource {
  final Dio dio;

  KarsaHusadaRemoteDatasourceImpl({required this.dio});

  @override
  Future<KarsaHusadaResponseEntity> getListKamar() async {
    try {
      final response = await dio.get('/api/service/rsud/karsa-husada/list-kamar-rawat');
      
      if (response.statusCode == 200) {
        // Mengamankan pembacaan JSON apakah dibungkus 'data' oleh backend Express atau langsung mentah
        final responseData = response.data['data'] ?? response.data;
        return KarsaHusadaResponseEntity.fromJson(responseData);
      } else {
        throw DioException(requestOptions: response.requestOptions, response: response);
      }
    } catch (e) {
      rethrow;
    }
  }
}