import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/domain/entities/appointment.dart';
import 'package:spa_app/presentation/providers/providers.dart';
import 'package:spa_app/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
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

      ],
    );
  }
}
