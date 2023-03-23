class Service {
  Service({
    required this.id,
    required this.name,
    required this.information,
    required this.fee,
    required this.url,
    required this.createdDate,
    this.modifiedDate,
    required this.createdBy,
    this.modifiedBy,
  });
  late final int id;
  late final String name;
  late final String information;
  late final int fee;
  late final String url;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    information = json['information'];
    fee = json['fee'];
    url = json['url'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['information'] = information;
    _data['fee'] = fee;
    _data['url'] = url;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    return _data;
  }
}
