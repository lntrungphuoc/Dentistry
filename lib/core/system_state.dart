import 'package:app_dentristy_mobile/core/secure_storage.dart';
import 'package:get/get.dart';

class SystemState extends GetxController {
  RxInt activeTab = 0.obs;

  void changeTab(value) {
    activeTab = value;
  }

  RxInt activeCategoryTab = 0.obs;

  void changeCategoryTab(value) {
    activeCategoryTab = value;
  }

  RxString userName = "".obs;
  void changeUserName() async {
    var loggedInName = await SecureStorage.getLoggedInUser();
    if (loggedInName != null) {
      userName.value = loggedInName;
    }
    else {
      userName.value = "";
    }
  }
}