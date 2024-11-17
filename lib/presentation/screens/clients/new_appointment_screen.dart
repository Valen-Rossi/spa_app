import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/presentation/providers/services/services_providers.dart';

class NewAppointmentScreen extends ConsumerStatefulWidget {

  static const name= 'new-appointment-screen';

  const NewAppointmentScreen({super.key});

  @override
  NewAppointmentScreenState createState() => NewAppointmentScreenState();
}

class NewAppointmentScreenState extends ConsumerState<NewAppointmentScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(servicesProvider.notifier).getServices;
  }

  @override
  Widget build(BuildContext context) {

    final services = ref.watch(servicesProvider);

    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {

        final service = services[index];

        return Card(
          child: Text(service.name),
        );
      },
    );
  }
}