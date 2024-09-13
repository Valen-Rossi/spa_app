import 'appointment.dart';


class Service {
  final int id;
  final String name;
  final String description;
  final int duration; // En minutos
  final double price;
  final String category;
  final List<Appointment> appointments;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.price,
    required this.category,
    required this.appointments,
  });
}
