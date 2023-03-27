import 'package:app_dentristy_mobile/model/e_healthbook_detail.dart';

abstract class IHealthBookDetailRepository {
  Future<List<EHealthBookDetail>> getByHealthBookId(int id);
}