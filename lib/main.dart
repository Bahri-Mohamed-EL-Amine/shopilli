import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopilli/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:shopilli/features/navigation/bloc/navigation_bloc.dart';
import 'package:shopilli/features/navigation/view/home_view.dart';
import 'package:shopilli/features/products/presentation/bloc/cart/cart_bloc.dart';
import 'package:shopilli/features/products/presentation/bloc/products/products_bloc.dart';
import 'ingection_container.dart' as di;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  di.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              di.instance<ProductsBloc>()..add(ProductsGetAllEvent()),
        ),
        BlocProvider(
          create: (_) => di.instance<NavigationBloc>(),
        ),
        BlocProvider(
          create: (_) =>
              di.instance<CategoriesBloc>()..add(CategoriesGetAllEvent()),
        ),
        BlocProvider(
          create: (_) => di.instance<CartBloc>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
