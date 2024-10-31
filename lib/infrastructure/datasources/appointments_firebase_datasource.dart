import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spa_app/domain/datasources/appointments_datasource.dart';
import 'package:spa_app/domain/entities/entities.dart';
import 'package:spa_app/infrastructure/mappers/appointment_mapper.dart';
import 'package:spa_app/infrastructure/models/firebase/appointment_firebase.dart';

class AppointmentsFirebaseDatasource extends IAppointmentsDatasource {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  
  @override
  Future<List<Appointment>> getClientAppointments(String clientId) async {
    
    CollectionReference collectionReferenceAppointments = db.collection('reservasServicios');

    // Obtén los documentos de la colección
    QuerySnapshot queryAppointments = await collectionReferenceAppointments.get();

    // Lista para almacenar las noticias
    final List<Appointment> appointments = queryAppointments.docs.map((doc) {
      
      // Mapea cada documento a AppointmentsFromFirebase
      final appointmentFromFirebase = AppointmentFromFirebase.fromJson(doc.id, doc.data() as Map<String, dynamic>);

      // Utiliza el mapper para convertir AppointmentsFromFirebase a Appointments
      return AppointmentMapper.appointmentFirebaseToEntity(appointmentFromFirebase);
    }).toList();

    return appointments;
  }
}
