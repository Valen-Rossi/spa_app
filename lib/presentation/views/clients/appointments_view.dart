import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spa_app/domain/entities/appointment.dart';
import 'package:spa_app/presentation/providers/providers.dart';
import 'package:spa_app/presentation/widgets/widgets.dart';

class AppointmentsView extends ConsumerStatefulWidget {
  const AppointmentsView({super.key});

  @override
  AppointmentsViewState createState() => AppointmentsViewState();
}

class AppointmentsViewState extends ConsumerState<AppointmentsView> {
  @override
  void initState() {
    super.initState();

    ref.read(clientAppointmentsProvider.notifier).loadAppointments();
  }

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    final clientAppointments = ref.watch(clientAppointmentsProvider);
    final List<Appointment> upComingAppointments= [];
    final List<Appointment> previousAppointments= [];

    clientAppointments.forEach((element) {
      if (element.date.isAfter(DateTime.now())) {
        upComingAppointments.add(element);
      }
    });

    clientAppointments.forEach((element) {
      if (element.date.isBefore(DateTime.now())) {
        previousAppointments.add(element);
      }
    });
    
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(),
      
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Text("Turnos Pendientes",textAlign: TextAlign.start, style: textStyles.titleMedium,),
          ),
      
          AppointmentsListView(upComingAppointments: upComingAppointments),
      
          const Divider(
            height: 50,
          ),
      
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10, bottom: 20),
            child: Text("Historial de Turnos",textAlign: TextAlign.start, style: textStyles.titleMedium,),
          ),
      
          AppointmentsListView(upComingAppointments: previousAppointments),
      
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () => context.push('/appointments/new-appointment'),
        child: const Icon(Icons.add), 
      ),
    );
  }
}
