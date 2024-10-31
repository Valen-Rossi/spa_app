import 'package:spa_app/domain/entities/entities.dart';


abstract class IAppointmentsRepository {

  Future<List<Appointment>> getClientAppointments(String clientId);
  
}