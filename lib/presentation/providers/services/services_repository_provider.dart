import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/infrastructure/datasources/services_firebase_datasource.dart';
import 'package:spa_app/infrastructure/repositories/services_repository_impl.dart';

//Este repositorio es inmutable
final servicesRepositoryProvider = Provider((ref) {

  return ServicesRepositoryImpl(ServicesFirebaseDatasource());
});