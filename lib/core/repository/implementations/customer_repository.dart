import 'package:app_dentristy_mobile/model/customer.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:app_dentristy_mobile/service/interfaces/i_http_services.dart';
import 'package:get/get.dart';

import '../../../model/login_request.dart';
import '../interfaces/i_customer_repository.dart';

class CustomerRepository implements ICustomerRepository {
  String BASE_URL = "customer";
  late IHttpServices _httpServices;

  CustomerRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<Customer?> login(LoginRequest request) async {
    Customer? customer;
    try {
      final response = await _httpServices.postRequest(
          "${BASE_URL}/login", request.toJson());
      if (response.data['data'] != null) {
        customer = Customer.fromJson(response.data['data']);
      }
    } on Exception catch (e) {
      print(e);
    }
    return customer;
  }
}
