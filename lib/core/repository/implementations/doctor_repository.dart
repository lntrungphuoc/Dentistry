import 'package:app_dentristy_mobile/core/repository/interfaces/i_doctor_repository.dart';
import 'package:app_dentristy_mobile/model/doctor.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:app_dentristy_mobile/service/interfaces/i_http_services.dart';
import 'package:get/get.dart';

class DoctorRepository implements IDoctorRepository {
  late IHttpServices _httpServices;

  DoctorRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<List<Doctor>> getAll() async {
    List<Doctor> listDoctor = [];

    try {
      final response = await _httpServices.getRequest('doctor');
      listDoctor = List<Doctor>.from(response.data.map((e) => Doctor.fromJson(e)));
    } on Exception catch (e) {
      print(e);
    }
    return listDoctor;
  }
}
