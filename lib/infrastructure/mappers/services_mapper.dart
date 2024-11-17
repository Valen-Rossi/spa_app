import 'package:spa_app/domain/entities/entities.dart';
import 'package:spa_app/infrastructure/models/firebase/service_firebase.dart';

class ServiceMapper {
    static Service serviceFirebaseToEntity(ServiceFromFirebase serviceFirebase) => Service(
      id: serviceFirebase.id,
      isSelected: serviceFirebase.isSelected, 
      name: serviceFirebase.name, 
      price: serviceFirebase.price, 
      professional: serviceFirebase.professional, 
    );
}
