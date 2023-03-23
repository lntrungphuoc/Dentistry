import 'package:app_dentristy_mobile/core/repository/interfaces/i_service_repository.dart';
import 'package:app_dentristy_mobile/model/service.dart';
import 'package:get/get.dart';

import '../../../core/repository/implementations/service_repository.dart';

class ServiceController extends GetxController {
  late IServiceRepository _serviceRepository;

  ServiceController() {
    _serviceRepository = Get.find<ServiceRepository>();
    getAllService();
  }

  late RxList<Service> listService;

  RxBool isLoading = false.obs;

  getAllService() async {
    showLoading();

    final result = await _serviceRepository.getAll();

    hideLoading();

    if (result != null) {
      listService = result.obs;
    } else {
      print("No data received");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}