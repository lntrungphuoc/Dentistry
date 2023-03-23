import 'package:app_dentristy_mobile/model/e_healthbook.dart';
import 'package:app_dentristy_mobile/model/service.dart';

class EHealthBookService {
  EHealthBookService({
    required this.id,
    required this.idEHealthBook,
    required this.idService,
    required this.createdDate,
     this.modifiedDate,
    required this.createdBy,
     this.modifiedBy,
    required this.eHealthBook,
    required this.service,
  });
  late final int id;
  late final int idEHealthBook;
  late final int idService;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;
  late final EHealthBook eHealthBook;
  late final Service service;
  
  EHealthBookService.fromJson(Map<String, dynamic> json){
    id = json['id'];
    idEHealthBook = json['idEHealthBook'];
    idService = json['idService'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    eHealthBook = EHealthBook.fromJson(json['eHealthBook']);
    service = Service.fromJson(json['service']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['idEHealthBook'] = idEHealthBook;
    _data['idService'] = idService;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    _data['eHealthBook'] = eHealthBook.toJson();
    _data['service'] = service.toJson();
    return _data;
  }
}