import 'package:spa_app/domain/entities/news.dart';


abstract class NewsRepository {

  Future<List<News>> getRecentNews({int page = 1});
  
}