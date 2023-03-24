import 'package:app_dentristy_mobile/core/repository/implementations/make_appointment_repository.dart';
import 'package:app_dentristy_mobile/feature/make-appointment/controller/make_appointment_controller.dart';
import 'package:get/get.dart';

import '../../../core/repository/implementations/clinic_repository.dart';

class MakeAppointmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ClinicRepository());
    Get.put(MakeAppointmentRepository());
    Get.put(MakeAppointmentController());
  }
}
