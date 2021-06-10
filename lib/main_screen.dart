import 'package:flutter/material.dart';
import 'package:travelapp/card_item.dart';
import 'package:travelapp/item_list.dart';
import 'package:travelapp/model/category_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "B.co Fashion Store",
            style: TextStyle(
                fontSize: 22.0,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final Category listCategory = CategoryList[index];

            return InkWell(
                onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ItemList(
                          category: listCategory.name,
                          items: listCategory.items,
                        );
                      }))
                    },
                child: CardItem(
                    category: listCategory.name,
                    imagePath: listCategory.backgroundPath));
          },
          itemCount: CategoryList.length,
        ));
  }
}
