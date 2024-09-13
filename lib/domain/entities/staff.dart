import 'appointment.dart';


class Staff {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String profilePath;
  final bool isLogged;
  final List<Appointment> appointments;

  Staff({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.profilePath,
    required this.isLogged,
    required this.appointments,
  });
}
