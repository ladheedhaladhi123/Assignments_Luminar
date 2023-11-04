import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_application1/api%20integration/using_http/model/productModel.dart';
import 'package:rive/math.dart';

class ProductTile extends StatelessWidget {
 final ProductModel product;

 ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: CachedNetworkImage(imageUrl: product.image!,
            fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.title!,
            style: const TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold),
          ),
          Text(
            '${product.price!}\$',
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
