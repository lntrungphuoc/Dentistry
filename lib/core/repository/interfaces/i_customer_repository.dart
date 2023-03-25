import 'package:app_dentristy_mobile/model/login_request.dart';

import '../../../model/customer.dart';

abstract class ICustomerRepository {
  Future<Customer?> login(LoginRequest request);
}