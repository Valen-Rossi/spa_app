import 'package:spa_app/domain/entities/comment.dart';


class News {
  final String id;
  final String title;
  final String description;
  final List<Comment> comments;
  final String imageUrl;

  News({
    required this.id,
    required this.title,
    required this.description,
    required this.comments,
    required this.imageUrl,
  });
}
