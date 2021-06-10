import 'package:flutter/material.dart';
import 'package:travelapp/card_item_product.dart';
import 'package:travelapp/detail_screen.dart';
import 'package:travelapp/model/category_list.dart';

class ItemList extends StatelessWidget {
  final String category;
  final List<ItemsFashion> items;

  ItemList({
    required this.category,
    required this.items,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (context, index) {
            final ItemsFashion item = items[index];

            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    product: item,
                  );
                }));
              },
              child: CardItemProduct(
                product: item,
              ),
            );
          },
          itemCount: items.length),
    );
  }
}
