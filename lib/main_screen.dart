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
            "B.co Fashion Store Size : ${MediaQuery.of(context).size.width}",
            style: TextStyle(
                fontSize: 22.0,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return FashionCategoryList();
          } else if (constraints.maxWidth <= 1200) {
            return FashionCategoryGrid(
              gridCount: 3,
            );
          } else {
            return FashionCategoryGrid(gridCount: 5);
          }
        }));
  }
}

class FashionCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Category listCategory = CategoryList[index];

        return InkWell(
            onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
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
    );
  }
}

class FashionCategoryGrid extends StatelessWidget {
  final int gridCount;
  FashionCategoryGrid({required this.gridCount});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GridView.count(
            crossAxisCount: gridCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: CategoryList.map((category) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ItemList(
                        category: category.name, items: category.items);
                  }));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Image.asset(
                        category.backgroundPath,
                        fit: BoxFit.cover,
                      )),
                      SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          category.name,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
