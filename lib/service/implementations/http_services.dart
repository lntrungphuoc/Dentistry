import 'package:app_dentristy_mobile/service/interfaces/i_http_services.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';

const BASE_URL = "https://10.0.2.2:7011/";

class HttpServices implements IHttpServices {
  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(BASE_URL + url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> postRequest(String url, Object data) async {
    Response response;
    try {
      response = await _dio.post(BASE_URL + url, data: data);
    } on DioError catch (e) {
      print(e);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (e, handler) {
      print(e.message);
      handler.next(e);
    }, onRequest: (r, handler) {
      print(r.method);
      print(r.path);
      handler.next(r);
    }, onResponse: (r, handler) {
      handler.next(r);
    }));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL));

    initializeInterceptors();
  }
}
