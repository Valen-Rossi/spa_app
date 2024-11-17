import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spa_app/domain/datasources/services_datasource.dart';
import 'package:spa_app/domain/entities/entities.dart';
import 'package:spa_app/infrastructure/mappers/services_mapper.dart';
import 'package:spa_app/infrastructure/models/firebase/service_firebase.dart';

class ServicesFirebaseDatasource extends IServicesDatasource {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  
  @override
  Future<List<Service>> getServices() async {
    
    CollectionReference collectionReferenceServices = db.collection('servicios');

    // Obtén los documentos de la colección
    QuerySnapshot queryServices = await collectionReferenceServices.get();

    // Lista para almacenar las noticias
    final List<Service> services = queryServices.docs.map((doc) {
      
      // Mapea cada documento a ServicesFromFirebase
      final serviceFromFirebase = ServiceFromFirebase.fromJson(doc.data() as Map<String, dynamic>);

      // Utiliza el mapper para convertir ServicesFromFirebase a Services
      return ServiceMapper.serviceFirebaseToEntity(serviceFromFirebase);
    }).toList();

    return services;
  }
}
