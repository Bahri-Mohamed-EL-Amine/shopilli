import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopilli/core/constants/app_colors.dart';
import 'package:shopilli/features/navigation/bloc/navigation_bloc.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: AppColors.primaryColor,
      onTap: (index) {
        BlocProvider.of<NavigationBloc>(context)
            .add(NavigationTriggeredEvent(index: index));
      },
      items: const [
        Icon(Icons.store),
        Icon(Icons.menu),
        Icon(Icons.shopping_cart),
      ],
    );
  }
}
