import 'package:app_dentristy_mobile/core/repository/implementations/list_news_repository.dart';
import 'package:app_dentristy_mobile/feature/list_news/controller/list_news_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ListNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListNewsRepository());
    Get.put(ListNewsController());
  }

}