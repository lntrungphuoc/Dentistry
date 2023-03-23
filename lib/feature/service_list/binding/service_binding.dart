import 'package:app_dentristy_mobile/core/repository/implementations/service_repository.dart';
import 'package:app_dentristy_mobile/feature/service_list/controller/service_controller.dart';
import 'package:get/get.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ServiceRepository());
    Get.put(ServiceController());
  }

}