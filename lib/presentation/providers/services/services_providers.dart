import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/domain/entities/entities.dart';
import 'package:spa_app/presentation/providers/services/services_repository_provider.dart';

final servicesProvider = StateNotifierProvider<ServicesNotifier, List<Service>>((ref) {
  
  final getServices= ref.watch(servicesRepositoryProvider).getServices;

  return ServicesNotifier(
    getServices: getServices
    );
});

typedef GetServicesCallBack = Future<List<Service>> Function();

class ServicesNotifier extends StateNotifier<List<Service>>{

  GetServicesCallBack getServices;

  ServicesNotifier({
    required this.getServices,
  }): super([]);

  Future<void> loadServices() async{

    final List<Service> services = await getServices();

    state = [...services];
  }

  void updateServiceSelection(String serviceId, bool isSelected) {
    state = [
      for (final service in state)
        if (service.id == serviceId)
          service.copyWith(isSelected: isSelected)
        else
          service,
    ];
  }

}