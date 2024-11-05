
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/domain/entities/entities.dart';
import 'package:spa_app/presentation/providers/appointments/appointments_repository_provider.dart';

final clientAppointmentsProvider = StateNotifierProvider<AppointmentsNotifier, List<Appointment>>((ref) {
  
  final getAppointments= ref.watch(appointmentsRepositoryProvider).getClientAppointments;

  return AppointmentsNotifier(
    getAppointments: getAppointments
    );
});

typedef GetAppointmentsCallBack = Future<List<Appointment>> Function(String clientId);

class AppointmentsNotifier extends StateNotifier<List<Appointment>>{

  GetAppointmentsCallBack getAppointments;

  AppointmentsNotifier({
    required this.getAppointments,
  }): super([]);

  Future<void> loadAppointments() async{

    // if (state[clientId] != null) return;

    final List<Appointment> appointments = await getAppointments("8IA5p6gmdhVGeDVGmLj4I6IeNz33");

    state = [...appointments];
  }
}