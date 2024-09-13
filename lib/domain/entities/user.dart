import 'appointment.dart';


class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String role; // "client" o "staff"
  final String profilePath;
  final bool isLogged;
  final List<Appointment> appointments; // Citas del usuario, ya sea cliente o personal
  final String? address; // Solo si es un cliente, puede ser null para personal
  final String? staffRole; // Especifica el rol del staff, puede ser null si es un cliente

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.profilePath,
    required this.isLogged,
    required this.appointments,
    this.address, // Null si no es un cliente
    this.staffRole, // Null si no es staff
  });
}
