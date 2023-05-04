import 'package:app_dentristy_mobile/model/news.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:get/get.dart';

import '../../../service/interfaces/i_http_services.dart';
import '../interfaces/i_list_news_repository.dart';

class ListNewsRepository implements IListNewsReposioty {
  String BASE_URL = "news";

  late IHttpServices _httpServices;

  ListNewsRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<List<News>> getAll() async {
    List<News> listNews = [];
    try {
      final response = await _httpServices.getRequest(BASE_URL);
      listNews = List<News>.from(response.data.map((e) => News.fromJson(e)));
    } on Exception catch (e) {
      print(e);
    }
    return listNews;
  }
}
