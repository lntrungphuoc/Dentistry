import 'dart:convert';

import 'package:app_dentristy_mobile/core/system_state.dart';
import 'package:app_dentristy_mobile/model/customer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future saveLoginData(Customer customer) async {
    await storage.write(key: "customer", value: json.encode(customer.toJson()));
  }

  static Future getLoggedInUser() async {
    var jsonCustomer = await storage.read(key: "customer");
    if (jsonCustomer != null) {
      return Customer.fromJson(jsonDecode(jsonCustomer));
    }
    return null;
  }

  static Future logOut() async {
    await storage.delete(key: "customer");
    var state = Get.put(SystemState());
    state.changeUserName();
  }
}