import 'entities.dart';


class Service {
  final bool isSelected;
  final String name;
  final double price;
  final Professional professional;

  Service({
    required this.isSelected,
    required this.name,
    required this.price,
    required this.professional,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    isSelected: json['isSelected'] ?? false,
    name: json['nombre'] ?? '',
    price: double.parse(json['precio'].toString() ?? "0"),
    professional: Professional.fromJson(json['profesional']),
  );

  Map<String, dynamic> toJson() => {
    'isSelected': isSelected,
    'nombre': name,
    'precio': price,
    'profesional': professional.toJson(),
  };

}
