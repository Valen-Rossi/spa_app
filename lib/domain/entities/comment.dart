import 'package:spa_app/domain/entities/user.dart';


class Comment {
  final User user;
  final String text;
  

  Comment({
    required this.user,
    required this.text,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    user: json["user"] ?? '',
    text: json["text"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "text": text,
  };
}
