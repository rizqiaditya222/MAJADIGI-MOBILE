import 'package:dio/dio.dart';
import 'package:majadigi/features/bapenda/domain/entities/info_pajak_entity.dart';

abstract class InfoPajakRemoteDatasource {
  Future<InfoPajakEntity> getInfoPajak(String platNomor, String nomorRangka);
}

class InfoPajakRemoteDatasourceImpl implements InfoPajakRemoteDatasource {
  final Dio dio;
  InfoPajakRemoteDatasourceImpl({required this.dio});

  @override
  Future<InfoPajakEntity> getInfoPajak(String platNomor, String nomorRangka) async {
    try {
      final response = await dio.get(
        '/api/service/bapenda/pkb/info-pajak',
        data: {
          "license_plate_number": platNomor,
          "chassis_number": nomorRangka
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final responseData = response.data['data'] ?? response.data;
        return InfoPajakEntity.fromJson(responseData);
      }
      throw DioException(requestOptions: response.requestOptions, response: response);
    } catch (e) {
      rethrow;
    }
  }
}