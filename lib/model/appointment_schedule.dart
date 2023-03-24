import 'package:app_dentristy_mobile/model/clinic.dart';

class AppointmentSchedule {
  AppointmentSchedule({
    required this.id,
    required this.idClinic,
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.time,
    required this.content,
    this.createdDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
    this.clinic,
  });
  late final int id;
  late final int idClinic;
  late final String name;
  late final String phoneNumber;
  late final DateTime date;
  late final DateTime time;
  late final String content;
  late final DateTime? createdDate;
  late final DateTime? modifiedDate;
  late final int? createdBy;
  late final int? modifiedBy;
  late final Clinic? clinic;

  AppointmentSchedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idClinic = json['idClinic'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    date = json['date'];
    time = json['time'];
    content = json['content'];
    createdDate = DateTime.parse(json['createdDate']);
    modifiedDate = json['modifiedDate'] == null ? null : DateTime.parse(json['modifiedDate']);
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    clinic = Clinic.fromJson(json['clinic']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['idClinic'] = idClinic;
    _data['name'] = name;
    _data['phoneNumber'] = phoneNumber;
    List<String> dateArray = date.toString().split(" ");
    _data['date'] = dateArray[0] + "T" + dateArray[1];
    List<String> timeArray = time.toString().split(" ");
    _data['time'] = timeArray[0] + "T" + timeArray[1];
    _data['content'] = content;
    _data['createdDate'] = createdDate?.toString();
    _data['modifiedDate'] = modifiedDate?.toString();
    _data['createdBy'] = createdBy;
    _data['modifiedBy'] = modifiedBy;
    return _data;
  }
}
