import 'package:app_dentristy_mobile/model/user_login_request.dart';
import '../../../model/user.dart';

abstract class IUSerRepository {
  Future<String> login(UserLoginRequest request);
  Future<User?> getUserInfo(String userName);
}