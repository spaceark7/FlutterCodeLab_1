import 'package:flutter/material.dart';
import 'package:travelapp/card_item.dart';
import 'package:travelapp/carousel_view.dart';
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
                color: Colors.white),
          ),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[CarouselView(),
                SizedBox(height: 10,),
                Text("Category",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
            
                ),),
                Flexible(
                  fit: FlexFit.loose,
                  child: FashionCategoryList()) 
                // Expanded(child: 
                //   FashionCategoryList() , )
                  ],
              ),
            ));
            // Container(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       Expanded(child: CarouselView()),
            //       Expanded(child: FashionCategoryList())
            //     ],
            //   ),
            // );
          } else if (constraints.maxWidth <= 1200) {
            return SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[CarouselView(),
                SizedBox(height: 10,),
                Text("Category",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
            
                ),),
                Flexible(
                  fit: FlexFit.loose,
                  child: FashionCategoryGrid(gridCount: 3)) 
                // Expanded(child: 
                //   FashionCategoryList() , )
                  ],
              ),
            ));
            
          } else {
            return  SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[CarouselView(),
                SizedBox(height: 10,),
                Text("Category",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
            
                ),),
                Flexible(
                  fit: FlexFit.loose,
                  child: FashionCategoryGrid(gridCount: 5)) 
                // Expanded(child: 
                //   FashionCategoryList() , )
                  ],
              ),
            ));
          }
        }));
  }
}

class FashionCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
    return 
         Padding(
          padding: const EdgeInsets.all(24.0),
          child: GridView.count(
            shrinkWrap: true,
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
                        padding: const EdgeInsets.all( 8.0),
                        child: Text(
                          category.name,
                          textAlign: TextAlign.center,
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
        );
  }
}
