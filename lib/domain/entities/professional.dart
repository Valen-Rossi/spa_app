

class Professional {
  final String email;
  final String name;

  Professional({
    required this.email,
    required this.name,
  });

  factory Professional.fromJson(Map<String, dynamic> json) => Professional(
    email: json['email'] ?? '',
    name: json['nombre'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'nombre': name,
  };
}