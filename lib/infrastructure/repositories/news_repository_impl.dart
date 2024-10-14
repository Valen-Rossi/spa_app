
import 'package:spa_app/domain/datasources/news_datasource.dart';
import 'package:spa_app/domain/entities/news.dart';
import 'package:spa_app/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends INewsRepository{

  final INewsDatasource newsDatasource;

  NewsRepositoryImpl(this.newsDatasource);

  @override
  Future<List<News>> getRecentNews({int page = 1}) {
    return newsDatasource.getRecentNews(page: page);
  }
  
}