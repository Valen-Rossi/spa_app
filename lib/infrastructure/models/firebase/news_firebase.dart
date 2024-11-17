import '../../../domain/entities/comment.dart';

class NewsFromFirebase {
  final String id;
  final String title;
  final String description;
  final List<Comment> comments;
  final String imageUrl;

  NewsFromFirebase({
    required this.id,
    required this.title,
    required this.description,
    required this.comments,
    required this.imageUrl,
  });

  factory NewsFromFirebase.fromJson(String id, Map<String, dynamic> json) => NewsFromFirebase(
    id: id, // El ID se pasa desde el DocumentSnapshot
    title: json["title"] ?? '',
    description: json["description"] ?? '',
    comments: json["comentarios"] != null
        ? List<Comment>.from(json["comentarios"].map((x) => Comment.fromJson(x)))
        : [],
    imageUrl: json["imageUrl"] ?? 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg',
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "comentarios": List<dynamic>.from(comments.map((x) => x.toJson())),
    "imageUrl": imageUrl,
  };
}
