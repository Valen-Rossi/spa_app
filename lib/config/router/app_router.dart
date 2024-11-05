import 'package:go_router/go_router.dart';

import 'package:spa_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [

        GoRoute(
          path: 'news/:id',
          name: NewsScreen.name,
          builder: (context, state) {

            final newsId = state.pathParameters['id'] ?? 'no-id';

            return NewsScreen(newsId: newsId);
          }
        ),

      ]
    ),

    

  ]
);