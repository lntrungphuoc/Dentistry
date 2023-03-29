import 'package:app_dentristy_mobile/core/repository/interfaces/i_health_book_repository.dart';
import 'package:app_dentristy_mobile/model/e_healthbook.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:app_dentristy_mobile/service/interfaces/i_http_services.dart';
import 'package:get/get.dart';

class HealthBookRepository implements IHealthBookRepostiory {
  String BASE_URL = "eHealthBook";
  late IHttpServices _httpServices;

  HealthBookRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<List<EHealthBook>> getAll(int idCustomer) async {
    List<EHealthBook> listHealthBook = [];
    try {
      var response =
          await _httpServices.getRequest("$BASE_URL/$idCustomer");
      listHealthBook = List<EHealthBook>.from(response.data.map((e) => EHealthBook.fromJson(e)));
    } on Exception catch (e) {
      print(e);
    }
    return listHealthBook;
  }
}
