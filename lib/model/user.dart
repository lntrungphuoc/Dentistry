class User {
  User({
    required this.id,
    required this.userName,
    required this.fullName,
     this.roles,
  });
  late final int id;
  late final String userName;
  late final String fullName;
  late final Null roles;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userName = json['userName'];
    fullName = json['fullName'];
    roles = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userName'] = userName;
    _data['fullName'] = fullName;
    _data['roles'] = roles == null ? null : roles;
    return _data;
  }
}