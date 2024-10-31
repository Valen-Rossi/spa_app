import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/infrastructure/datasources/appointments_firebase_datasource.dart';
import 'package:spa_app/infrastructure/repositories/appointments_repository_impl.dart';

//Este repositorio es inmutable
final appointmentsRepositoryProvider = Provider((ref) {

  return AppointmentsRepositoryImpl(AppointmentsFirebaseDatasource());
});