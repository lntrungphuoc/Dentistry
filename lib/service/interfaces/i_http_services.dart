import 'package:dio/dio.dart';

abstract class IHttpServices {
  void init();

  Future<Response> getRequest(String url);
  Future<Response> postRequest(String url, Object data);
}