import 'package:app_dentristy_mobile/model/e_healthbook.dart';

abstract class IHealthBookRepostiory {
  Future<List<EHealthBook>> getAll(int idCustomer);
}