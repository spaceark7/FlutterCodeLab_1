import 'package:flutter/material.dart';
import 'package:travelapp/model/category_list.dart';

class CardItemProduct extends StatelessWidget {
  final ItemsFashion product;

  CardItemProduct({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Image(
                image: AssetImage(product.imagePath),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              )),
              SizedBox(height: 5,),
          Text(
            product.name,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Text(
            '\$${product.price}',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5,)
        ],
      ),
    );
  }
}
