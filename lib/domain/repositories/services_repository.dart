import 'package:spa_app/domain/entities/entities.dart';


abstract class IServicesRepository {

  Future<List<Service>> getServices();
  
}