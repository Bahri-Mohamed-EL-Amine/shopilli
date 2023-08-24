import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopilli/features/products/data/models/product_model.dart';
import 'package:shopilli/features/products/domain/entities/porduct.dart';

class ProductWidget extends StatelessWidget {
  final Product product = ProductModel.fromJson(const {
    "id": 1,
    "title": "iPhone 9",
    "description": "An apple mobile which is nothing like apple",
    "price": 549,
    "discountPercentage": 12.96,
    "rating": 4.69,
    "stock": 94,
    "brand": "Apple",
    "category": "smartphones",
    "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
    "images": [
      "https://i.dummyjson.com/data/products/1/1.jpg",
      "https://i.dummyjson.com/data/products/1/2.jpg",
      "https://i.dummyjson.com/data/products/1/3.jpg",
      "https://i.dummyjson.com/data/products/1/4.jpg",
      "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
    ]
  });
  ProductWidget({super.key});
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
              "https://i.dummyjson.com/data/products/21/3.jpg",
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
