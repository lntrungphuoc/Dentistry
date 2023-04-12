import 'package:app_dentristy_mobile/model/e_healthbook_detail.dart';

class Attachment {
  Attachment({
    required this.id,
    required this.url,
    required this.fileName,
    required this.idEHealthBookDetail,
    required this.createdDate,
    this.modifiedDate,
    required this.createdBy,
    this.modifiedBy,
    this.eHealthBookDetail,
  });
  late final int id;
  late final String url;
  late final String fileName;
  late final int idEHealthBookDetail;
  late final DateTime createdDate;
  late final DateTime? modifiedDate;
  late final int createdBy;
  late final int? modifiedBy;
  late final EHealthBookDetail? eHealthBookDetail;

  Attachment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    fileName = json['fileName'];
    idEHealthBookDetail = json['idEHealthBookDetail'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifieddBy'];
    eHealthBookDetail = json['eHealthBookDetail'] == null ? null : EHealthBookDetail.fromJson(json['eHealthBookDetail']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['url'] = url;
    _data['fileName'] = fileName;
    _data['idEHealthBookDetail'] = idEHealthBookDetail;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    _data['eHealthBookDetail'] = eHealthBookDetail!.toJson();
    return _data;
  }
}
