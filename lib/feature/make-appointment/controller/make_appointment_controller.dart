import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class MakeAppointmentController extends GetxController {
  final appointmentFormKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  var clinicControler = TextEditingController();
  final nameController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  final contentController = TextEditingController();

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

  void makeAppointment(context) {
    if (appointmentFormKey.currentState!.validate()) {
      // Get.snackbar('Thành công', 'Đăng ký lịch hẹn thành công');
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
    }
  }
}
