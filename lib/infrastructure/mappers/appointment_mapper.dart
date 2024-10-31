import 'package:spa_app/domain/entities/entities.dart';
import 'package:spa_app/infrastructure/models/firebase/appointment_firebase.dart';

class AppointmentMapper {
    static Appointment appointmentFirebaseToEntity(AppointmentFromFirebase appointmentFirebase) => Appointment(
      id: appointmentFirebase.id,
      client: appointmentFirebase.client, 
      totalCost: appointmentFirebase.totalCost, 
      status: appointmentFirebase.status, 
      date: appointmentFirebase.date, 
      paymentDate: appointmentFirebase.paymentDate, 
      time: appointmentFirebase.time, 
      paymentMethod: appointmentFirebase.paymentMethod, 
      services: appointmentFirebase.services 
    );
}
