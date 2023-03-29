import 'dart:convert';

import 'package:app_dentristy_mobile/core/system_state.dart';
import 'package:app_dentristy_mobile/model/customer.dart';
import 'package:app_dentristy_mobile/model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future saveLoggedInCustomer(Customer customer) async {
    await storage.write(key: "customer", value: json.encode(customer.toJson()));
  }

  static Future getLoggedInCustomer() async {
    var jsonCustomer = await storage.read(key: "customer");
    if (jsonCustomer != null) {
      return Customer.fromJson(jsonDecode(jsonCustomer));
    }
    return null;
  }

  static Future logOut() async {
    await storage.delete(key: "customer");
    await storage.delete(key: "user");
    var state = Get.put(SystemState());
    state.changeUserName();
  }

  static Future saveLoggedInUser(User user) async {
    await storage.write(key: "user", value: json.encode(user.toJson()));
  }

  static Future getLoggedInUser() async {
    var jsonUser = await storage.read(key: "user");
    if (jsonUser != null) {
      return User.fromJson(jsonDecode(jsonUser));
    }
    return null;
  }
}