import 'package:spa_app/domain/datasources/services_datasource.dart';
import 'package:spa_app/domain/entities/entities.dart';
import 'package:spa_app/domain/repositories/services_repository.dart';

class ServicesRepositoryImpl extends IServicesRepository{

  final IServicesDatasource servicesDatasource;

  ServicesRepositoryImpl(this.servicesDatasource);

  @override
  Future<List<Service>> getServices() {
    return servicesDatasource.getServices();
  }
  
}