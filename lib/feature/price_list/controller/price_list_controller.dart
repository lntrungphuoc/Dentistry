import 'package:app_dentristy_mobile/core/repository/interfaces/i_price_list_repository.dart';
import 'package:app_dentristy_mobile/model/price_list.dart';
import 'package:get/get.dart';

import '../../../core/repository/implementations/price_list_repository.dart';

class PriceListController extends GetxController {
  late IPriceListRepository _repository;

  PriceListController() {
    _repository = Get.find<PriceListRepository>();
    getAllPriceList();
  }

  late RxList<PriceList> listPriceList;

  late RxList<PriceList> foundPriceLists;

  RxBool isLoading = false.obs;

  getAllPriceList() async {
    showLoading();

    var response = await _repository.getAll();

    hideLoading();

    if (response != null) {
      listPriceList = response.obs;
      foundPriceLists = listPriceList;
    }
    else {
      print('No pricelist data is found');
    }
  }

  Future<void> RefreshData() async {
    showLoading();

    var response = await _repository.getAll();

    hideLoading();

    if (response != null) {
      listPriceList = response.obs;
      foundPriceLists = listPriceList;
    }
    else {
      print('No pricelist data is found');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}