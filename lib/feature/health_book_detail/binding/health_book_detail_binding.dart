import 'package:app_dentristy_mobile/core/repository/implementations/health_book_detail_repository.dart';
import 'package:app_dentristy_mobile/feature/health_book_detail/controller/health_book_detail_controller.dart';
import 'package:get/get.dart';

class HealthBookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HealthBookDetailRepository());
    Get.put(HealthBookDetailController());
  }

}