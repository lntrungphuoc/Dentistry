import 'package:app_dentristy_mobile/model/doctor.dart';
import 'package:app_dentristy_mobile/model/e_healthbook_detail.dart';

class EHealthBookDetailDoctor {
  EHealthBookDetailDoctor({
    required this.id,
    required this.idDoctor,
    required this.idEHealthBookDetail,
    required this.createdDate,
     this.modifiedDate,
    required this.createdBy,
     this.modifiedBy,
    required this.doctor,
    required this.eHealthBookDetail,
  });
  late final int id;
  late final int idDoctor;
  late final int idEHealthBookDetail;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;
  late final Doctor doctor;
  late final EHealthBookDetail eHealthBookDetail;
  
  EHealthBookDetailDoctor.fromJson(Map<String, dynamic> json){
    id = json['id'];
    idDoctor = json['idDoctor'];
    idEHealthBookDetail = json['idEHealthBookDetail'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    doctor = Doctor.fromJson(json['doctor']);
    eHealthBookDetail = EHealthBookDetail.fromJson(json['eHealthBookDetail']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['idDoctor'] = idDoctor;
    _data['idEHealthBookDetail'] = idEHealthBookDetail;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    _data['doctor'] = doctor.toJson();
    _data['eHealthBookDetail'] = eHealthBookDetail.toJson();
    return _data;
  }
}