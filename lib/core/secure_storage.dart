import 'package:app_dentristy_mobile/core/system_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future saveLoginData(String userName) async {
    await storage.write(key: "userName", value: userName);
  }

  static Future getLoggedInUser() async {
    var res = await storage.read(key: "userName");
    return res;
  }

  static Future logOut() async {
    await storage.delete(key: "userName");
    var state = Get.put(SystemState());
    state.changeUserName();
  }
}