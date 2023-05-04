import 'package:app_dentristy_mobile/core/repository/interfaces/i_list_news_repository.dart';
import 'package:app_dentristy_mobile/model/news.dart';
import 'package:get/get.dart';

import '../../../core/repository/implementations/list_news_repository.dart';

class ListNewsController extends GetxController {
  late IListNewsReposioty _listNewsReposioty;

  ListNewsController() {
    _listNewsReposioty = Get.find<ListNewsRepository>();
    getAllNews();
  }

  late RxList<News> listNews;

  RxBool isLoading = false.obs;

  void getAllNews() async {
    showLoading();

    var response = await _listNewsReposioty.getAll();

    hideLoading();

    if (response != null) {
      listNews = response.obs;
    }
    else {
      print('No news data is found');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
