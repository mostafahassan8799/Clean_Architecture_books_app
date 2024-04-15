import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  final baseUrl = "https://www.googleapis.com/books/v1/";

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    _dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
    var response = await _dio.get(
      '$baseUrl$endPoint',
    );
    return response.data;
  }
}
