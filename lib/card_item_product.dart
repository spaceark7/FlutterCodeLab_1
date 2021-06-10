import 'package:flutter/material.dart';
import 'package:travelapp/model/category_list.dart';

class CardItemProduct extends StatelessWidget {
  final ItemsFashion product;

  CardItemProduct({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Container(
                    child: Image(
                  image: AssetImage(product.imagePath),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ))),
            Text(
              product.name,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
