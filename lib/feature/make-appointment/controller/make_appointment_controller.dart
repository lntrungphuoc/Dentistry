import 'dart:developer';

import 'package:app_dentristy_mobile/core/repository/implementations/clinic_repository.dart';
import 'package:app_dentristy_mobile/core/repository/interfaces/i_clinic_repository.dart';
import 'package:app_dentristy_mobile/core/repository/interfaces/i_doctor_repository.dart';
import 'package:app_dentristy_mobile/core/repository/interfaces/i_make_appointment_repository.dart';
import 'package:app_dentristy_mobile/model/appointment_schedule.dart';
import 'package:app_dentristy_mobile/model/clinic.dart';
import 'package:app_dentristy_mobile/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:intl/intl.dart';

import '../../../core/repository/implementations/make_appointment_repository.dart';

class MakeAppointmentController extends GetxController {
  final appointmentFormKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  var clinicControler = TextEditingController();
  final nameController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  final contentController = TextEditingController();

  late IClinicRepository _clinicRepository;

  late IMakeAppointmentRepository _makeAppointmentRepository;

  MakeAppointmentController() {
    _clinicRepository = Get.find<ClinicRepository>();
    _makeAppointmentRepository = Get.find<MakeAppointmentRepository>();
    getClinic();
  }

  late RxList<Clinic> listClinic;

  RxBool isLoading = false.obs;

  void getClinic() async {
    showLoading();

    var response = await _clinicRepository.getAll();

    hideLoading();

    if (response != null) {
      listClinic = response.obs;
    } else {
      print("No clinic data is found");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    clinicControler.dispose();
    dateController.dispose();
    timeController.dispose();
    contentController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng điền vào trường này';
    }
    return null;
  }

  void clearController() {
    phoneController.clear();
    clinicControler.clear();
    nameController.clear();
    dateController.clear();
    timeController.clear();
    contentController.clear();
  }

  Future<void> makeAppointment(context) async {
    if (appointmentFormKey.currentState!.validate()) {
      // Get.snackbar('Thành công', 'Đăng ký lịch hẹn thành công');
      var appointmentRequest = AppointmentSchedule(
          id: 0,
          idClinic: clinicControler.text == listClinic[0].address ||
                  clinicControler.text == ""
              ? listClinic[0].id
              : int.parse(clinicControler.text),
          name: nameController.text,
          phoneNumber: phoneController.text,
          date: DateTime.parse(dateController.text),
          time: DateFormat("yyyy-MM-dd hh:mm:ss")
              .parse(dateController.text + " " + timeController.text + ":00"),
          content: contentController.text);
      var response =
          await _makeAppointmentRepository.create(appointmentRequest);
      if (response == true) {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            showCloseIcon: true,
            title: "Thành công",
            desc: "Bạn đã đặt lịch thành công",
            btnOkOnPress: () {
              appointmentFormKey.currentState?.reset();
              clearController();
            }).show();
      } else {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.topSlide,
                showCloseIcon: true,
                title: "Không thành công",
                desc: "Có lỗi xảy ra, vui lòng thử lại",
                btnOkOnPress: () {})
            .show();
      }
    }
  }
}
