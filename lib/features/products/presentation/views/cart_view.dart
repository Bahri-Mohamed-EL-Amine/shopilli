import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopilli/core/widgets/loadin_widget.dart';
import 'package:shopilli/features/products/presentation/bloc/cart/cart_bloc.dart';
import 'package:shopilli/features/products/presentation/widgets/cart_item_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(CartGetAllEvent());
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const LoadingWidget();
        } else if (state is CartLoadedState) {
          if (state.products.isEmpty) {
            return const Center(
              child: Text('No products'),
            );
          }
          int totalPrice = state.products.fold(
              0,
              (previousValue, element) =>
                  previousValue + element.quantity * element.product.price);
          return Column(
            children: [
              Text(totalPrice.toString()),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: ((context, index) {
                    return CartItemWidget(cartItem: state.products[index]);
                  }),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
