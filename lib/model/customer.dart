import 'package:app_dentristy_mobile/model/e_healthbook.dart';

class Customer {
  Customer({
    required this.id,
    required this.customerName,
    required this.phoneNumber,
    this.address,
    required this.password,
    this.cccd,
    required this.bhyt,
    required this.createdDate,
    this.modifiedDate,
    required this.createdBy,
    this.modifiedBy,
     this.eHealthBooks,
  });
  late final int id;
  late final String customerName;
  late final String phoneNumber;
  late final String? address;
  late final String password;
  late final String? cccd;
  late final String bhyt;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;
  late final EHealthBook? eHealthBooks;
  
  Customer.fromJson(Map<String, dynamic> json){
    id = json['id'];
    customerName = json['customerName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'] == null ? null : json['address'];
    password = json['password'];
    cccd = json['cccd'] == null ? null : json['cccd'];
    bhyt = json['bhyt'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    eHealthBooks = json['eHealthBooks'] == null ? null : EHealthBook.fromJson(json['eHealthBooks']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['customerName'] = customerName;
    _data['phoneNumber'] = phoneNumber;
    _data['address'] = address == null ? null : address;
    _data['password'] = password;
    _data['cccd'] = cccd == null ? null : cccd;
    _data['bhyt'] = bhyt;
    _data['createdDate'] = createdDate == null ? null : createdDate.toIso8601String();
    _data['modifiedDate'] = modifiedDate == null ? null : modifiedDate!.toIso8601String();
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    _data['eHealthBooks'] = eHealthBooks == null ? null : eHealthBooks!.toJson();
    return _data;
  }
}