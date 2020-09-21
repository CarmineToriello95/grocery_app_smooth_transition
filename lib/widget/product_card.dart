import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Object imageHeroTag;

  const ProductCard({
    @required this.product,
    this.imageHeroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0), color: Colors.white),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: imageHeroTag,
              child: Image.asset(
                product.imagePath,
                height: 100,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            '\$ ${product.price}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text('${product.name}'),
          SizedBox(
            height: 4.0,
          ),
          Text(
            '${product.weight}',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
