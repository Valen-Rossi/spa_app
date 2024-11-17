import '../../../domain/entities/entities.dart';

class ServiceFromFirebase {
 final String id;
  final bool isSelected;
  final String name;
  final double price;
  final Professional professional;

  ServiceFromFirebase({
    required this.id,
    required this.isSelected,
    required this.name,
    required this.price,
    required this.professional,
  });

 factory ServiceFromFirebase.fromJson(Map<String, dynamic> json) => ServiceFromFirebase(
    id: json['Document ID']?? '',
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
