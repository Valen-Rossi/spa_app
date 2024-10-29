import 'appointment.dart';


class Client {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String profilePath;
  final bool isLogged;
  final List<Appointment> appointments;

  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.profilePath,
    required this.isLogged,
    required this.appointments,
  });
}
