import 'package:app_dentristy_mobile/model/doctor.dart';

abstract class IDoctorRepository {
  Future<List<Doctor>> getAll();
}