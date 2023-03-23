import 'package:app_dentristy_mobile/model/attachment.dart';
import 'package:app_dentristy_mobile/model/e_healthbook.dart';
import 'package:app_dentristy_mobile/model/e_healthbook_detail_doctor.dart';
import 'package:app_dentristy_mobile/model/e_healthbook_detail_service.dart';

class EHealthBookDetail {
  EHealthBookDetail({
    required this.id,
    required this.checkUpDate,
    required this.diagnose,
    required this.medicine,
    required this.reExaminationDate,
    required this.idEHealthBook,
    required this.createdDate,
     this.modifiedDate,
    required this.createdBy,
     this.modifiedBy,
    required this.eHealthBookDetailDoctor,
    required this.attachments,
    required this.eHealthBookDetailServices,
     this.eHealthBook,
  });
  late final int id;
  late final DateTime checkUpDate;
  late final String diagnose;
  late final String medicine;
  late final DateTime reExaminationDate;
  late final int idEHealthBook;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;
  late final List<EHealthBookDetailDoctor> eHealthBookDetailDoctor;
  late final List<Attachment> attachments;
  late final List<EHealthBookDetailService> eHealthBookDetailServices;
  late final EHealthBook? eHealthBook;
  
  EHealthBookDetail.fromJson(Map<String, dynamic> json){
    id = json['id'];
    checkUpDate = json['checkUpDate'];
    diagnose = json['diagnose'];
    medicine = json['medicine'];
    reExaminationDate = json['reExaminationDate'];
    idEHealthBook = json['idEHealthBook'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    eHealthBookDetailDoctor = List.from(json['eHealthBookDetailDoctor']).map((e)=>EHealthBookDetailDoctor.fromJson(e)).toList();
    attachments = List.from(json['attachments']).map((e)=>Attachment.fromJson(e)).toList();
    eHealthBookDetailServices = List.from(json['eHealthBookDetailServices']).map((e)=>EHealthBookDetailService.fromJson(e)).toList();
    eHealthBook = json['eHealthBook'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['checkUpDate'] = checkUpDate;
    _data['diagnose'] = diagnose;
    _data['medicine'] = medicine;
    _data['reExaminationDate'] = reExaminationDate;
    _data['idEHealthBook'] = idEHealthBook;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    _data['eHealthBookDetailDoctor'] = eHealthBookDetailDoctor.map((e)=>e.toJson()).toList();
    _data['attachments'] = attachments.map((e)=>e.toJson()).toList();
    _data['eHealthBookDetailServices'] = eHealthBookDetailServices.map((e)=>e.toJson()).toList();
    _data['eHealthBook'] = eHealthBook;
    return _data;
  }
}