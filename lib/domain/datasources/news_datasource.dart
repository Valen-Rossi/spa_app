import 'package:spa_app/domain/entities/news.dart';


abstract class INewsDatasource {

  Future<List<News>> getRecentNews({int page = 1});
  
}