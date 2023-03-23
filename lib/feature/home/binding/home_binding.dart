import 'package:app_dentristy_mobile/core/repository/implementations/service_repository.dart';
import 'package:app_dentristy_mobile/core/system_state.dart';
import 'package:get/get.dart';

import '../../service_list/controller/service_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ServiceRepository());
    Get.put(ServiceController());
    Get.put(SystemState());
  }

}