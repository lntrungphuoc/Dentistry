import 'package:app_dentristy_mobile/feature/make-appointment/controller/make_appointment_controller.dart';
import 'package:get/get.dart';

class MakeAppointmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MakeAppointmentController());
  }
}
