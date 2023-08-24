import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopilli/features/products/domain/entities/porduct.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});
  // final Product product = Product(brand: "iphone" );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.network(
              product.thumbnail,
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
                initialRating: product.rating,
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
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
            child: const Text('Add to cart'),
          )
        ],
      ),
    );
  }
}
