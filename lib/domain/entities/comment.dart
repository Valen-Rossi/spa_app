
class Comment {
  final String user;
  final String text;
  

  Comment({
    required this.user,
    required this.text,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    user: json["usuario"] ?? '',
    text: json["comentario"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "text": text,
  };
}
