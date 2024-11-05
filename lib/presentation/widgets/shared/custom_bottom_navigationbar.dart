import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationbar extends StatelessWidget {
  const CustomBottomNavigationbar({super.key});

  int getCurrentIndex(BuildContext context) {
  final String location = GoRouterState.of(context).matchedLocation;

  switch (location) {
    case '/':
      return 0;
    case '/appointments':
      return 1;
    default:
      return 0;
  }
}

  void onItemTapped(BuildContext context, int index) {

    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/appointments');
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: getCurrentIndex(context),
      onTap: (value) => onItemTapped(context, value),
      items: const [

        BottomNavigationBarItem(
          label: "Inicio",
          icon: Icon(Icons.home_outlined) 
        ),

        BottomNavigationBarItem(
          label: "Turnos",
          icon: Icon(Icons.date_range_rounded)
        ),

      ],
    );
  }
}