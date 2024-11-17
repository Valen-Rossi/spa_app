import 'package:spa_app/domain/datasources/appointments_datasource.dart';
import 'package:spa_app/domain/entities/entities.dart';
import 'package:spa_app/domain/repositories/appointments_repository.dart';

class AppointmentsRepositoryImpl extends IAppointmentsRepository{

  final IAppointmentsDatasource appointmentsDatasource;

  AppointmentsRepositoryImpl(this.appointmentsDatasource);

  @override
  Future<List<Appointment>> getClientAppointments(String clientId) {
    return appointmentsDatasource.getClientAppointments(clientId);
  }
  
}