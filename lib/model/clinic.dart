class Clinic {
  Clinic({
    required this.id,
    required this.address,
    required this.phoneNumber,
    required this.createdDate,
    this.modifiedDate,
    required this.createdBy,
    this.modifiedBy,
  });
  late final int id;
  late final String address;
  late final String phoneNumber;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['address'] = address;
    _data['phoneNumber'] = phoneNumber;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    return _data;
  }
}
