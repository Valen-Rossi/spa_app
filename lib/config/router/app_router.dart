import 'package:go_router/go_router.dart';

import 'package:spa_app/presentation/screens/screens.dart';
import 'package:spa_app/presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    ShellRoute(
      builder: (context, state, child) {

        return HomeScreen(childView: child);
        
      },
      routes:[

        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeView();
          }, 
          routes: [

            GoRoute(
              path: 'news/:id',
              name: NewsScreen.name,

              builder: (context, state) {

                final newsId = state.pathParameters['id'] ?? 'no-id';

                return NewsScreen(newsId: newsId);
              }
            )

          ]
        ),
        
        GoRoute(
          path: '/appointments',
          builder: (context, state) {
            return const AppointmentsView();
          }, 
          routes: [

            GoRoute(
              path: '/new-appointment' ,
              name: NewAppointmentScreen.name,
              builder: (context, state) {
                return const NewAppointmentScreen();
              },
            )

          ]
        ),

      ]
    )
  ]
);