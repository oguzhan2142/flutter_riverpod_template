import 'package:dio/dio.dart';

import '../model/app_response.dart';
import '../model/auth.dart';
import 'request_type.dart';

class NetworkManager {
  final base = 'http://localhost:3000';
  static final NetworkManager instance = NetworkManager._();
  NetworkManager._() {
    // _client.interceptors.add(PrettyDioLogger());
  }

  final _client = Dio();

  Future<Response?> _getResponse(
    String requestUrl,
    RequestType requestType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  ) async {
    try {
      final options = Options(headers: {'Authorization': "Bearer ${Auth.getInstance()?.token}"});
      Response? response;
      switch (requestType) {
        case RequestType.GET:
          response = await _client.get(
            queryParameters: queryParameters,
            options: options,
            requestUrl,
          );
          break;
        case RequestType.POST:
          response = await _client.post(
            requestUrl,
            queryParameters: queryParameters,
            options: options,
            data: body,
          );
          break;
        case RequestType.PUT:
          response = await _client.put(
            requestUrl,
            queryParameters: queryParameters,
            options: options,
            data: body,
          );
          break;
        case RequestType.DELETE:
          response = await _client.delete(
            requestUrl,
            queryParameters: queryParameters,
            options: options,
            data: body,
          );
          break;
      }
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<AppResponse<T>> requestSingle<T>({
    required RequestType requestType,
    required String path,
    required T Function(Map<String, dynamic> json) converter,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    var requestUrl = base + path;

    try {
      var response = await _getResponse(requestUrl, requestType, queryParameters, body);

      if (response == null) {
        throw Exception();
      }
      Map<String, dynamic> data = response.data;

      T model = converter(data);
      return AppResponse(isSuccess: true, data: model);
    } catch (e) {
      return AppResponse(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }

  Future<List<T>?> requestList<T>({
    required RequestType requestType,
    required String path,
    required T Function(Map<String, dynamic> json) converter,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    var requestUrl = base + path;

    try {
      var response = await _getResponse(requestUrl, requestType, queryParameters, body);

      if (response == null) {
        throw Exception();
      }

      List dataList = response.data;
      List<T> models = [];
      for (var data in dataList) {
        T model = converter(data);
        models.add(model);
      }

      return models;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
