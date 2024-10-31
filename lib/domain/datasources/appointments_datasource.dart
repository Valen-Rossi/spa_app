import 'package:spa_app/domain/entities/entities.dart';


abstract class IAppointmentsDatasource {

  Future<List<Appointment>> getClientAppointments(String clientId);
  
}