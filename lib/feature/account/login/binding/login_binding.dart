import 'package:app_dentristy_mobile/feature/account/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }

}