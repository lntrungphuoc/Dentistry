import 'package:get/get.dart';

import '../../../model/appointment_schedule.dart';
import '../../../service/implementations/http_services.dart';
import '../../../service/interfaces/i_http_services.dart';
import '../interfaces/i_make_appointment_repository.dart';

class MakeAppointmentRepository implements IMakeAppointmentRepository {
  String BASE_URL = "appointment-schedule";

  late IHttpServices _httpServices;

  MakeAppointmentRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<bool> create(AppointmentSchedule appointmentRequest) async {
    bool status = false;
    try {
      final response = await _httpServices.postRequest(
          "${BASE_URL}/create", appointmentRequest.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        status = true;
      }
    } on Exception catch (e) {
      print(e);
    }
    return status;
  }
}
