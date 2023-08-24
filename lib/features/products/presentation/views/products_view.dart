import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopilli/features/products/presentation/bloc/products_bloc.dart';
import 'package:shopilli/features/products/presentation/widgets/product_widget.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductsErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: ((context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsLoadedState) {
            return MasonryGridView.builder(
              itemCount: state.products.length,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: ((context, index) {
                return ProductWidget(
                  product: state.products[index],
                );
              }),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
