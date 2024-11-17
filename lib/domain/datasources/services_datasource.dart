import 'package:spa_app/domain/entities/entities.dart';


abstract class IServicesDatasource {

  Future<List<Service>> getServices();
  
}