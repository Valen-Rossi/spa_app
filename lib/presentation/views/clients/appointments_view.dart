import 'package:flutter/material.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turnos'),
      ),
      body: const Center(child: Text('Turnos pendientes')),
    );
  }
}