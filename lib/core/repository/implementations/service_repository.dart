import 'dart:convert';

import 'package:app_dentristy_mobile/core/repository/interfaces/i_service_repository.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:app_dentristy_mobile/service/interfaces/i_http_services.dart';
import 'package:get/get.dart';

import '../../../model/service.dart';

class ServiceRepository implements IServiceRepository {
  late IHttpServices _httpServices;

  ServiceRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<List<Service>> getAll() async {
    List<Service> listService = [];
    try {
      final response = await _httpServices.getRequest("service");
      listService = List<Service>.from(response.data.map((e) => Service.fromJson(e)));
    } on Exception catch (e) {
      print(e);
    }
    return listService;
  }
}
