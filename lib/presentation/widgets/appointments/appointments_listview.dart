import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spa_app/domain/entities/appointment.dart';

class AppointmentsListView extends StatelessWidget {

  final List<Appointment> upComingAppointments;

  const AppointmentsListView({
    super.key, 
    required this.upComingAppointments
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: upComingAppointments.isEmpty ?50 :200,
          child: upComingAppointments.isEmpty
          ? const Text("No hay turnos pendientes")
          :ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: upComingAppointments.length,
            itemBuilder: (context, index) {
              
              final upComingAppointment = upComingAppointments[index];
              final formattedDate = DateFormat('dd/MM/yyyy').format(upComingAppointment.date);

              // Solo mostrar turnos pendientes (futuros)
                return ListTile(
                  title: Text("Fecha: $formattedDate"),
                );
              
            },
          ),
        );
  }
}