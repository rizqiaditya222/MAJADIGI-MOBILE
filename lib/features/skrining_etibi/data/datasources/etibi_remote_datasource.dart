import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:majadigi/injection_container.dart';
import 'package:majadigi/features/skrining_etibi/domain/entities/etibi_entity.dart';

abstract class EtibiRemoteDatasource {
  Future<List<EtibiLocationEntity>> getCities();
  Future<List<EtibiLocationEntity>> getDistricts(int cityId);
  Future<List<EtibiLocationEntity>> getVillages(int districtId);
  Future<bool> submitQuestionnaire(Map<String, dynamic> data);
  Future<List<EtibiHistoryEntity>> getHistoryList();
  Future<EtibiDetailEntity> getQuestionnaireDetail(int id); 
}

class EtibiRemoteDatasourceImpl implements EtibiRemoteDatasource {
  final Dio dio;
  EtibiRemoteDatasourceImpl({required this.dio});

  final String basePath = '/api/service/skrining-etibi';

  // 1. FUNGSI BANTUAN UNTUK MENYUNTIKKAN TOKEN SECARA MANUAL
  Future<Options> _getAuthHeaders() async {
    final prefs = s1<SharedPreferences>();
    final token = prefs.getString('token'); // Sesuaikan 'token' jika key-mu berbeda (misal: 'access_token')
    return Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  @override
  Future<List<EtibiLocationEntity>> getCities() async {
    final response = await dio.get('$basePath/list-kota');
    final List data = response.data['data'] ?? [];
    return data.map((e) => EtibiLocationEntity.fromJson(e, 'city_name')).toList();
  }

  @override
  Future<List<EtibiLocationEntity>> getDistricts(int cityId) async {
    final response = await dio.get('$basePath/list-kecamatan', data: {"city_id": cityId});
    final List data = response.data['data'] ?? [];
    return data.map((e) => EtibiLocationEntity.fromJson(e, 'district_name')).toList();
  }

  @override
  Future<List<EtibiLocationEntity>> getVillages(int districtId) async {
    final response = await dio.get('$basePath/list-kelurahan', data: {"district_id": districtId});
    final List data = response.data['data'] ?? [];
    return data.map((e) => EtibiLocationEntity.fromJson(e, 'village_name')).toList();
  }

  @override
  Future<bool> submitQuestionnaire(Map<String, dynamic> data) async {
    final options = await _getAuthHeaders(); // Pasang Token
    final response = await dio.post('$basePath/submit-kuisioner', data: data, options: options);
    return response.statusCode == 201;
  }

  @override
  Future<List<EtibiHistoryEntity>> getHistoryList() async {
    final options = await _getAuthHeaders(); 
    // KITA KEMBALIKAN PARAMETER PAGE & LIMIT KARENA BACKEND MEWAJIBKANNYA:
    final response = await dio.get(
      '$basePath/list-kuisioner', 
      data: {"page": 1, "limit": 100}, 
      options: options
    );
    final List data = response.data['data']['data'] ?? [];
    return data.map((e) => EtibiHistoryEntity.fromJson(e)).toList();
  }

  @override
  Future<EtibiDetailEntity> getQuestionnaireDetail(int id) async {
    final options = await _getAuthHeaders(); // Pasang Token
    final response = await dio.get('$basePath/kuisioner', data: {"questionnaire_id": id}, options: options);
    return EtibiDetailEntity.fromJson(response.data['data']);
  }
}