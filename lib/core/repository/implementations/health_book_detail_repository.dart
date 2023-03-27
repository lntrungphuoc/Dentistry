import 'package:app_dentristy_mobile/core/repository/interfaces/i_health_book_detail_repository.dart';
import 'package:app_dentristy_mobile/model/e_healthbook_detail.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:app_dentristy_mobile/service/interfaces/i_http_services.dart';
import 'package:get/get.dart';

class HealthBookDetailRepository implements IHealthBookDetailRepository {
  String BASE_URL = "eHealthBookDetail";
  late IHttpServices _httpServices;

  HealthBookDetailRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<List<EHealthBookDetail>> getByHealthBookId(int id) async {
    List<EHealthBookDetail> listHealthBookDetail = [];
    try {
      var response = await _httpServices.getRequest(BASE_URL + "/${id}");
      listHealthBookDetail = List<EHealthBookDetail>.from(response.data.map((e) => EHealthBookDetail.fromJson(e)));
    } on Exception catch (e) {
      print(e);
    }
    return listHealthBookDetail;
  }
}
