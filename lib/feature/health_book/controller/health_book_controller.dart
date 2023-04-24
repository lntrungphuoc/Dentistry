import 'package:app_dentristy_mobile/core/repository/interfaces/i_health_book_repository.dart';
import 'package:app_dentristy_mobile/core/secure_storage.dart';
import 'package:app_dentristy_mobile/model/e_healthbook.dart';
import 'package:get/get.dart';

import '../../../core/repository/implementations/health_book_repository.dart';

class HealthBookController extends GetxController {
  late IHealthBookRepostiory _healthBookRepostiory;

  HealthBookController() {
    _healthBookRepostiory = Get.find<HealthBookRepository>();
    getHealthBookByCustomerId();
  }

  late RxList<EHealthBook> listHealthBook;

  RxBool isLoading = false.obs;

  void getHealthBookByCustomerId() async {
    showLoading();

    var customer = await SecureStorage.getLoggedInCustomer();

    var response = await _healthBookRepostiory.getAll(customer.id);

    hideLoading();

    if (response != null) {
      listHealthBook = response.obs;
    } else {
      print('No eHealthBook data is found');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }

  String generateServiceString(int index) {
    var res = "";
    int length = listHealthBook[index].eHealthBookServices.length;
    for (int i = 0; i < length - 1; i++) {
      res =
          "$res${listHealthBook[index].eHealthBookServices[i].service.name}, ";
    }
    res = res +
        listHealthBook[index].eHealthBookServices[length - 1].service.name;
    return res;
  }
}
