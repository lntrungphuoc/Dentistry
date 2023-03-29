import 'package:app_dentristy_mobile/core/repository/implementations/customer_repository.dart';
import 'package:app_dentristy_mobile/core/repository/implementations/user_repository.dart';
import 'package:app_dentristy_mobile/feature/account/login/controller/customer_login_controller.dart';
import 'package:app_dentristy_mobile/feature/account/login/controller/user_login_controller.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository());
    Get.put(CustomerRepository());
    Get.put(UserLoginController());
    Get.put(CustomerLoginController());
  }

}