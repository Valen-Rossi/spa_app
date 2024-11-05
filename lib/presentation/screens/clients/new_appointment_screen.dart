import 'package:flutter/material.dart';

class NewAppointmentScreen extends StatelessWidget {

  static const name= 'new-appointment-screen';

  const NewAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Nuevo Turno'),
    );
  }
}