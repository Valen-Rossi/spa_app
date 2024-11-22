import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/presentation/providers/services/services_providers.dart';

import '../../../domain/entities/entities.dart';

class NewAppointmentScreen extends ConsumerStatefulWidget {
  static const name = 'new-appointment-screen';

  const NewAppointmentScreen({super.key});

  @override
  NewAppointmentScreenState createState() => NewAppointmentScreenState();
}

class NewAppointmentScreenState extends ConsumerState<NewAppointmentScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(servicesProvider.notifier).loadServices();
  }
  

  // Método para manejar la selección y deselección
  void toggleServiceSelection(Service service) {
    ref.read(servicesProvider.notifier).updateServiceSelection(service.id, !service.isSelected);
  }

  // Método para calcular el total
  double calculateTotal(List<Service> services) {
    return services
        .where((service) => service.isSelected)
        .fold(0, (total, service) => total + service.price);
  }

  @override
  Widget build(BuildContext context) {
    final services = ref.watch(servicesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(service.name),
                    subtitle: Text('\$${service.price.toStringAsFixed(2)}'),
                    trailing: Checkbox(
                      value: service.isSelected,
                      onChanged: (bool? value) {
                        toggleServiceSelection(service);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${calculateTotal(services).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                
                FilledButton.icon(
                  onPressed: (){
                    if (calculateTotal(services)==0) {
                      SnackBar(content: Text('data'));
                      
                    }
                  }, 
                  label: const Icon(Icons.navigate_next_rounded)
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
