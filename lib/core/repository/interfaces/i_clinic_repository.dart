import 'package:app_dentristy_mobile/model/clinic.dart';

import '../../../model/appointment_schedule.dart';

abstract class IClinicRepository {
  Future<List<Clinic>> getAll();
}