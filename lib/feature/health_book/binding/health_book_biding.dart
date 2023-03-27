import 'package:app_dentristy_mobile/core/repository/implementations/health_book_repository.dart';
import 'package:app_dentristy_mobile/feature/health_book/controller/health_book_controller.dart';
import 'package:get/get.dart';

class HealthBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HealthBookRepository());
    Get.put(HealthBookController());
  }

} 