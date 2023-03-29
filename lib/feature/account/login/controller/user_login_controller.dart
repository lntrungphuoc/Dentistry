import 'dart:developer';

import 'package:app_dentristy_mobile/core/repository/implementations/user_repository.dart';
import 'package:app_dentristy_mobile/core/repository/interfaces/i_user_repository.dart';
import 'package:app_dentristy_mobile/core/secure_storage.dart';
import 'package:app_dentristy_mobile/model/user_login_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/system_state.dart';

class UserLoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  late IUSerRepository _userRepository;

  UserLoginController() {
    _userRepository = Get.find<UserRepository>();
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
      var userLoginRequest = UserLoginRequest(
          username: userNameController.text, password: passwordController.text);

      var token = await _userRepository.login(userLoginRequest);

      if (token != "") {
        var user = await _userRepository.getUserInfo(userNameController.text);
        if (user != null) {
          SecureStorage.saveLoggedInUser(user);

          var state = Get.put(SystemState());

          state.changeUserName();

          state.activeTab = 0.obs;
          Get.toNamed("/home");
        } else {
          Get.snackbar(
            'Có lỗi xảy ra',
            'Vui lòng thử lại',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Đăng nhập thất bại',
          'Vui lòng kiểm tra tên tài khoản hoặc mật khẩu',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
