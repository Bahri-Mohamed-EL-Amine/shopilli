import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopilli/features/products/presentation/bloc/products_bloc.dart';
import 'package:shopilli/features/products/presentation/views/products_view.dart';
import 'ingection_container.dart' as di;

void main() {
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
      ],
      child: const MaterialApp(
        home: ProductsView(),
      ),
    );
  }
}
