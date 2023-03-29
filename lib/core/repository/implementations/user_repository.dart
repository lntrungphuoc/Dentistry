import 'package:app_dentristy_mobile/core/repository/interfaces/i_user_repository.dart';
import 'package:app_dentristy_mobile/model/user_login_request.dart';
import 'package:app_dentristy_mobile/model/user.dart';
import 'package:app_dentristy_mobile/service/implementations/http_services.dart';
import 'package:app_dentristy_mobile/service/interfaces/i_http_services.dart';
import 'package:get/get.dart';

class UserRepository implements IUSerRepository {
  String BASE_URL = "user";
  late IHttpServices _httpServices;

  UserRepository() {
    _httpServices = Get.put(HttpServices());
    _httpServices.init();
  }

  @override
  Future<User?> getUserInfo(String userName) async {
    User? user;
    try {
      final response = await _httpServices
          .getRequest("$BASE_URL/getLoggedInfo?userName=$userName");
      user = User.fromJson(response.data);
    } on Exception catch (e) {
      print(e);
      user = null;
    }
    return user;
  }

  @override
  Future<String> login(UserLoginRequest request) async {
    String token = "";
    try {
      final response =
          await _httpServices.postRequest("$BASE_URL/login", request.toJson());
      token = response.data['token'];
    } on Exception catch (e) {
      print(e);
    }
    return token;
  }
}
