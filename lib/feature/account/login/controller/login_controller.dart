import 'dart:developer';

import 'package:app_dentristy_mobile/core/repository/interfaces/i_customer_repository.dart';
import 'package:app_dentristy_mobile/core/secure_storage.dart';
import 'package:app_dentristy_mobile/model/login_request.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/repository/implementations/customer_repository.dart';
import '../../../../core/system_state.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  late ICustomerRepository _customerRepository;

  LoginController() {
    _customerRepository = Get.find<CustomerRepository>();
  }

  RxBool isLoading = false.obs;

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
      var loginRequest = LoginRequest(
          cccd: userNameController.text, password: passwordController.text);
      var customer = await _customerRepository.login(loginRequest);
      if (customer != null) {
        SecureStorage.saveLoginData(customer.customerName);

        // Get.snackbar(
        //   'Đăng nhập thành công',
        //   'Chào mừng bạn đến với TenApp',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        // );

        var state = Get.put(SystemState());

        state.changeUserName();

        state.activeTab = 0.obs;
        Get.toNamed("/home");
      } else {
        Get.snackbar(
          'Đăng nhập thất bại',
          'Vui lòng kiểm tra CCCD/CMND hoặc mật khẩu',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
