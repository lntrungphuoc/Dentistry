import 'package:app_dentristy_mobile/model/appointment_schedule.dart';
import 'package:app_dentristy_mobile/model/clinic.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:app_dentristy_mobile/service/interfaces/i_http_services.dart';
import 'package:get/get.dart';

import '../interfaces/i_clinic_repository.dart';

class ClinicRepository implements IClinicRepository {
  String BASE_URL = "clinic";

  late IHttpServices _httpServices;

  ClinicRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<List<Clinic>> getAll() async {
    List<Clinic> listClinic = [];
    try {
      final response = await _httpServices.getRequest(BASE_URL);
      listClinic =
          List<Clinic>.from(response.data.map((e) => Clinic.fromJson(e)));
    } on Exception catch (e) {
      print(e);
    }
    return listClinic;
  }
}
