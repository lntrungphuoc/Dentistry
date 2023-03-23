import 'package:app_dentristy_mobile/feature/price_list/controller/price_list_controller.dart';
import 'package:get/get.dart';

import '../../../core/repository/implementations/price_list_repository.dart';

class PriceListBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(PriceListRepository());
    Get.put(PriceListController());
  }

}