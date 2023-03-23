import 'package:app_dentristy_mobile/core/repository/implementations/doctor_repository.dart';
import 'package:app_dentristy_mobile/feature/doctor/controller/doctor_controller.dart';
import 'package:get/get.dart';

class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DoctorRepository());
    Get.put(DoctorController());
  }

}