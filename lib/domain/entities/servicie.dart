import 'entities.dart';


class Service {
  final String id;
  final bool isSelected;
  final String name;
  final double price;
  final Professional professional;

  Service({
    required this.id,
    required this.isSelected,
    required this.name,
    required this.price,
    required this.professional,
  });

  Map<String, dynamic> toJson() => {
    'isSelected': isSelected,
    'nombre': name,
    'precio': price,
    'profesional': professional.toJson(),
  };

  factory Service.fromJson(Map<String, dynamic> json) => Service(
      id: json['Document ID']?? '',
      isSelected: json['isSelected'] ?? false,
      name: json['nombre'] ?? '',
      price: double.parse(json['precio'].toString() ?? "0"),
      professional: Professional.fromJson(json['profesional']),
    );
    // Método copyWith para crear una copia del objeto con propiedades modificadas
  Service copyWith({
    String? id,
    bool? isSelected,
    String? name,
    double? price,
    Professional? professional,
  }) {
    return Service(
      id: id ?? this.id,
      isSelected: isSelected ?? this.isSelected,
      name: name ?? this.name,
      price: price ?? this.price,
      professional: professional ?? this.professional,
    );
  } 
}