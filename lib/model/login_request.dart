class LoginRequest {
  LoginRequest({
    required this.cccd,
    required this.password,
  });
  late final String cccd;
  late final String password;

  LoginRequest.fromJson(Map<String, dynamic> json) {
    cccd = json['cccd'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cccd'] = cccd;
    _data['password'] = password;
    return _data;
  }
}
