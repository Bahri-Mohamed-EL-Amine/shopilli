import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopilli/features/products/presentation/bloc/products_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
        // BlocProvider(create: (_) =>  ProductsBloc(getAllProductsUsecase: getAllProductsUsecase)),
      ],
      child: const MaterialApp(),
    );
  }
}
