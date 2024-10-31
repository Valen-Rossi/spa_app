import 'package:flutter/material.dart';

class CustomBottomNavigationbar extends StatelessWidget {
  const CustomBottomNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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