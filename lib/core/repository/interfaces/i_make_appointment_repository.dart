import '../../../model/appointment_schedule.dart';

abstract class IMakeAppointmentRepository {
  Future<bool> create(AppointmentSchedule appointmentRequest);
}