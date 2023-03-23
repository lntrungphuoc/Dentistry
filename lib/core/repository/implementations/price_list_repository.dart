import 'package:app_dentristy_mobile/core/repository/interfaces/i_price_list_repository.dart';
import 'package:app_dentristy_mobile/model/price_list.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:app_dentristy_mobile/service/interfaces/i_http_services.dart';
import 'package:get/get.dart';

class PriceListRepository implements IPriceListRepository {
  late IHttpServices _httpServices;

  PriceListRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<List<PriceList>> getAll() async {
    List<PriceList> listPriceList = [];
    try {
      final response = await _httpServices.getRequest("price-list");
      listPriceList =
          List<PriceList>.from(response.data.map((e) => PriceList.fromJson(e)));
    } on Exception catch (e) {
      print(e);
    }
    return listPriceList;
  }
}
