import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopilli/features/products/presentation/bloc/cart/cart_bloc.dart';

import '../../domain/entities/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 100,
        width: 100,
        child: Center(child: Image.network(cartItem.product.thumbnail)),
      ),
      title: Text(cartItem.product.title),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              BlocProvider.of<CartBloc>(context)
                  .add(CartRemoveProductEvent(cartItem: cartItem));
              BlocProvider.of<CartBloc>(context).add(CartGetAllEvent());
            },
            icon: const Icon(
              Icons.remove,
            ),
          ),
          Text(cartItem.quantity.toString()),
          IconButton(
            onPressed: () {
              BlocProvider.of<CartBloc>(context)
                  .add(CartAddProductEvent(product: cartItem));
              BlocProvider.of<CartBloc>(context).add(CartGetAllEvent());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      trailing: Text(
        '${cartItem.product.price}\$',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
