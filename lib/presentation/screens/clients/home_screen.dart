import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/domain/entities/appointment.dart';
import 'package:spa_app/presentation/providers/appointments/appointments_providers.dart';
import 'package:spa_app/presentation/providers/news/news_providers.dart';
import 'package:spa_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(recentNewsProvider.notifier).loadNextPage();
    ref.read(clientAppointmentsProvider.notifier).loadAppointments();
  }

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    final recentNews = ref.watch(recentNewsProvider);
    final clientAppointments = ref.watch(clientAppointmentsProvider);
    final List<Appointment> upComingAppointments= [];

    clientAppointments.forEach((element) {
      if (element.date.isBefore(DateTime.now())) {
        upComingAppointments.add(element);
      }
    });
    

    return Column(
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
          child: Text("Noticias",textAlign: TextAlign.start, style: textStyles.titleMedium,),
        ),


        NewsSlideshow(recentNews: recentNews),

        FilledButton.tonal(
          onPressed: () {},
          child: const Text("Ver Noticias"),
        ),
      ],
    );
  }
}
