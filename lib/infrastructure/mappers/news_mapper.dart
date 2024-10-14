import 'package:spa_app/domain/entities/news.dart';
import 'package:spa_app/infrastructure/models/firebase/news_firebase.dart';

class NewsMapper {
  static News newsFirebaseToEntity(NewsFromFirebase newsFirebase) => News(
      id: newsFirebase.id,
      title: newsFirebase.title,
      description: newsFirebase.description,
      comments: newsFirebase.comments,
      imageUrl: newsFirebase.imageUrl);
}
