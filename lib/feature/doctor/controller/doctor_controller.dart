import 'package:app_dentristy_mobile/core/repository/implementations/doctor_repository.dart';
import 'package:app_dentristy_mobile/core/repository/interfaces/i_doctor_repository.dart';
import 'package:get/get.dart';

import '../../../model/doctor.dart';

class DoctorController extends GetxController {
  late IDoctorRepository _doctorRepository;

  DoctorController(){
    _doctorRepository = Get.find<DoctorRepository>();
    getAllDoctor();
  }

  late RxList<Doctor> listDoctor;

  late RxList<Doctor> foundDoctors;

  RxBool isLoading = false.obs;

  void getAllDoctor() async {
    showLoading();

    var response = await _doctorRepository.getAll();

    hideLoading();

    if (response != null) {
      listDoctor = response.obs;
      foundDoctors = listDoctor;
    }
    else {
      print('No doctor data is found');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}