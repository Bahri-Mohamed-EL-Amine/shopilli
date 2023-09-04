import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopilli/core/widgets/my_navigation_bar.dart';
import 'package:shopilli/features/categories/presentation/pages/categories_view.dart';
import 'package:shopilli/features/navigation/bloc/navigation_bloc.dart';
import 'package:shopilli/features/products/presentation/bloc/cart/cart_bloc.dart';
import 'package:shopilli/features/products/presentation/views/cart_view.dart';
import 'package:shopilli/features/products/presentation/views/products_view.dart';

import '../../../core/widgets/my_app_bar.dart';
import '../../../core/widgets/my_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar,
      drawer: const MyDrawer(),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationStoreState) {
            return const ProductsView();
          } else if (state is NavigationCategoriesState) {
            return const CategoriesView();
          } else if (state is NavigationCartState) {
            //BlocProvider.of<CartBloc>(context).add(CartGetAllEvent());
            return const CartView();
          }
          return Container();
        },
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
