import 'package:app_dentristy_mobile/core/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/system_state.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng điền vào trường này';
    }
    return null;
  }

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      if (userNameController.text == "a" && passwordController.text == "a") {

        SecureStorage.saveLoginData(userNameController.text);

        var state = Get.put(SystemState());

        state.changeUserName();

        state.activeTab = 0.obs;
        Get.toNamed("/home");
      }
      else {
        print("ko ok");
      }
    }
  }

}