import 'package:app_dentristy_mobile/model/service.dart';

import 'e_healthbook_detail.dart';

class EHealthBookDetailService {
  EHealthBookDetailService({
    required this.id,
    required this.idEHealthBookDetail,
    required this.idService,
    required this.createdDate,
     this.modifiedDate,
    required this.createdBy,
     this.modifiedBy,
    required this.eHealthBookDetail,
    required this.service,
  });
  late final int id;
  late final int idEHealthBookDetail;
  late final int idService;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;
  late final EHealthBookDetail eHealthBookDetail;
  late final Service service;
  
  EHealthBookDetailService.fromJson(Map<String, dynamic> json){
    id = json['id'];
    idEHealthBookDetail = json['idEHealthBookDetail'];
    idService = json['idService'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    eHealthBookDetail = EHealthBookDetail.fromJson(json['eHealthBookDetail']);
    service = Service.fromJson(json['service']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['idEHealthBookDetail'] = idEHealthBookDetail;
    _data['idService'] = idService;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    _data['eHealthBookDetail'] = eHealthBookDetail.toJson();
    _data['service'] = service.toJson();
    return _data;
  }
}