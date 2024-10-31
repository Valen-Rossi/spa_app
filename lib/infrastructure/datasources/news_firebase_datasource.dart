import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spa_app/domain/datasources/news_datasource.dart';
import 'package:spa_app/domain/entities/news.dart';
import 'package:spa_app/infrastructure/mappers/news_mapper.dart';
import 'package:spa_app/infrastructure/models/firebase/news_firebase.dart'; // Importa el mapper

class NewsFirebaseDatasource extends INewsDatasource {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  
  @override
  Future<List<News>> getRecentNews({int page = 1}) async {
    
    CollectionReference collectionReferenceNews = db.collection('noticias');

    // Obtén los documentos de la colección
    QuerySnapshot queryNews = await collectionReferenceNews.get();

    // Lista para almacenar las noticias
    final List<News> news = queryNews.docs.map((doc) {
      
      // Mapea cada documento a NewsFromFirebase
      final newsFromFirebase = NewsFromFirebase.fromJson(doc.id, doc.data() as Map<String, dynamic>);

      // Utiliza el mapper para convertir NewsFromFirebase a News
      return NewsMapper.newsFirebaseToEntity(newsFromFirebase);
    }).toList();

    return news;
  }
}
