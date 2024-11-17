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

}
