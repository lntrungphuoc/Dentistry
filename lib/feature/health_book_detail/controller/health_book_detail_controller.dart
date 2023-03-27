import 'package:app_dentristy_mobile/core/repository/interfaces/i_health_book_detail_repository.dart';
import 'package:app_dentristy_mobile/model/e_healthbook_detail.dart';
import 'package:get/get.dart';

import '../../../core/repository/implementations/health_book_detail_repository.dart';

class HealthBookDetailController extends GetxController {
  late IHealthBookDetailRepository _healthBookDetailRepository;

  HealthBookDetailController() {
    _healthBookDetailRepository = Get.find<HealthBookDetailRepository>();
    getByIdHealthBook();
  }

  late RxList<EHealthBookDetail> listHealthBookDetail;

  RxBool isLoading = false.obs;

  void getByIdHealthBook() async {

    showLoading();
    
    var healthBookId = Get.arguments;

    var response = await _healthBookDetailRepository.getByHealthBookId(healthBookId);

    hideLoading();

    if (response != null) {
      listHealthBookDetail = response.obs;
    }
    else {
      print('No eHealthBookDetail data is found');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}