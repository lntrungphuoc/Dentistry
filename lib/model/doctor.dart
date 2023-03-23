class Doctor {
  Doctor({
    required this.id,
    required this.name,
    required this.information,
    required this.isDoctor,
    required this.avatarUrl,
    required this.createdDate,
    this.modifiedDate,
    required this.createdBy,
    this.modifiedBy,
  });
  late final int id;
  late final String name;
  late final String information;
  late final bool isDoctor;
  late final String avatarUrl;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    information = json['information'];
    isDoctor = json['isDoctor'];
    avatarUrl = json['avatarUrl'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['information'] = information;
    _data['isDoctor'] = isDoctor;
    _data['avatarUrl'] = avatarUrl;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    return _data;
  }
}
