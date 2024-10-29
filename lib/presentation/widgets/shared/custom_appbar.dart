import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.spa_outlined, color: colors.primary,),
              const SizedBox(width: 5),
              Text('Spa: Sentirse Bien', style: textStyles.titleMedium,),

              const Spacer(),

              IconButton(
                onPressed: () {
                  
                }, 
                icon: const Icon(Icons.person_2_outlined)
              )
            ],
            ),
        ), 
      )
    );
  }
}