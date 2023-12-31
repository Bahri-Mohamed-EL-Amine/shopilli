import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopilli/features/products/domain/entities/cart_item.dart';
import 'package:shopilli/features/products/domain/entities/porduct.dart';
import 'package:shopilli/features/products/presentation/bloc/cart/cart_bloc.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.grey[100],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.network(
              product.thumbnail,
              scale: 2,
            ),
          ),
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                itemSize: 15,
                itemCount: 5,
                //initialRating: product.rating as double,
                onRatingUpdate: (value) {},
                ignoreGestures: true,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
              ),
              Text(
                '(${product.rating})',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${product.price} \$',
            style: const TextStyle(color: Colors.green),
          ),
          ElevatedButton(
            onPressed: () {
              final cartItem = CartItem(product: product);
              BlocProvider.of<CartBloc>(context).add(
                CartAddProductEvent(product: cartItem),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
            child: const Text('Add to cart'),
          ),
        ],
      ),
    );
  }
}
