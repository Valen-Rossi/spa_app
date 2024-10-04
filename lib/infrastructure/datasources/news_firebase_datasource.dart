import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:spa_app/domain/datasources/news_datasource.dart';
import 'package:spa_app/domain/entities/news.dart';


class NewsFirebaseDatasource extends INewsDatasource{

  final FirebaseFirestore db = FirebaseFirestore.instance;
  
  @override
  Future<List<News>> getRecentNews({int page = 1}) async{
    
    CollectionReference collectionReferenceNews = db.collection('noticias');

    QuerySnapshot queryNews = await collectionReferenceNews.get();

    final List<News> news =[];

    return news;
  }
  
}