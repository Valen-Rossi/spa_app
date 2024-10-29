import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/infrastructure/datasources/news_firebase_datasource.dart';
import 'package:spa_app/infrastructure/repositories/news_repository_impl.dart';

//Este repositorio es inmutable
final newsRepositoryProvider = Provider((ref) {

  return NewsRepositoryImpl(NewsFirebaseDatasource());
});