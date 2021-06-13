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
          title: Text("$category Collection", 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22),
      ),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 800) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: FashionItemView(
                category: category, items: items, gridCount: 2),

            )
            
            ;
          } else if (constraints.maxWidth <= 1200) {
            return FashionItemView(
                category: category, items: items, gridCount: 3);
          } else {
            return FashionItemView(
                category: category, items: items, gridCount: 4);
          }
        }));
  }
}

class FashionItemView extends StatelessWidget {
  final String category;
  final List<ItemsFashion> items;
  final int gridCount;

  FashionItemView(
      {required this.category, required this.items, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
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
            itemCount: items.length));
  }
}
