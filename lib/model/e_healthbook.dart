import 'package:app_dentristy_mobile/model/clinic.dart';
import 'package:app_dentristy_mobile/model/customer.dart';
import 'package:app_dentristy_mobile/model/e_healthbook_detail.dart';
import 'package:app_dentristy_mobile/model/e_healthbook_service.dart';

class EHealthBook {
  EHealthBook({
    required this.id,
    required this.totalFee,
    required this.idClinic,
    required this.idCustomer,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
    this.eHealthBookDetails,
    required this.eHealthBookServices,
    required this.clinic,
    required this.customer,
  });
  late final int id;
  late final double totalFee;
  late final int idClinic;
  late final int idCustomer;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;
  late final List<EHealthBookDetail>? eHealthBookDetails;
  late final List<EHealthBookService> eHealthBookServices;
  late final Clinic clinic;
  late final Customer customer;
  
  EHealthBook.fromJson(Map<String, dynamic> json){
    id = json['id'];
    totalFee = double.parse(json['totalFee'].toString());
    idClinic = json['idClinic'];
    idCustomer = json['idCustomer'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'] == null ? null : json['modifiedBy'];
    eHealthBookDetails = json['eHealthBookDetails'] == null ? null : List.from(json['eHealthBookDetails']).map((e)=>EHealthBookDetail.fromJson(e)).toList();
    eHealthBookServices = List.from(json['eHealthBookServices']).map((e)=>EHealthBookService.fromJson(e)).toList();
    clinic = Clinic.fromJson(json['clinic']);
    customer = Customer.fromJson(json['customer']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['totalFee'] = totalFee;
    _data['idClinic'] = idClinic;
    _data['idCustomer'] = idCustomer;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    _data['eHealthBookDetails'] = eHealthBookDetails!.map((e) => e.toJson()).toList();
    _data['eHealthBookServices'] = eHealthBookServices.map((e)=>e.toJson()).toList();
    _data['clinic'] = clinic.toJson();
    _data['customer'] = customer.toJson();
    return _data;
  }
}