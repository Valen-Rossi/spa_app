import 'package:spa_app/domain/entities/news.dart';


abstract class INewsRepository {

  Future<List<News>> getRecentNews({int page = 1});
  
}