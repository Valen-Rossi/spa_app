
class Client {
  final String id;
  final String name;
  final String email;
  bool isLogged;

  Client({
    required this.id,
    required this.name,
    required this.email,
    this.isLogged=false,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    email: json['email'] ?? '',
    name: json['nombreCompleto'] ?? '',
    id: json['uid'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'uid': id,
    'email': email,
    'nombreCompleto': name,
  };
}
