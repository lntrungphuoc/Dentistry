import 'package:app_dentristy_mobile/model/price_list.dart';

abstract class IPriceListRepository {
  Future<List<PriceList>> getAll();
}