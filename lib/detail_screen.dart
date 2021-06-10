import 'package:flutter/material.dart';
import 'package:travelapp/model/category_list.dart';

class DetailScreen extends StatelessWidget {
  final ItemsFashion product;

  DetailScreen({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ImageContainer(
                image: product.imagePath,
              ),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    FavoriteButton()
                  ],
                ),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: TitleName(
              text: "${product.name}",
            ),
          ),
          ActionBar(
            category: product.category,
            color: product.color,
            price: product.price,
          ),
          DescriptionBox(description: "${product.description}"),
          ImageContainerScroll(),
        ],
      ),
    )));
  }
}

class TitleName extends StatelessWidget {
  final String text;
  TitleName({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    );
  }
}

class ActionBar extends StatelessWidget {
  final String category;
  final String color;
  final double price;

  ActionBar({
    required this.category,
    required this.color,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(Icons.checkroom),
              Text("$category"),
              SizedBox(
                height: 8.0,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.palette),
              Text("$color"),
              SizedBox(
                height: 8.0,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.monetization_on),
              Text("\$ $price"),
              SizedBox(
                height: 8.0,
              )
            ],
          )
        ],
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  final String description;
  DescriptionBox({required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black45, fontSize: 16.0),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String image;

  ImageContainer({required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.asset(image);
  }
}

class ImageContainerScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12.withOpacity(0.02),
                        blurRadius: 3.0,
                        offset: Offset(0, 0),
                        spreadRadius: 0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg')),
              )),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12.withOpacity(0.03),
                        blurRadius: 3.0,
                        offset: Offset(0, 0),
                        spreadRadius: 0)
                  ]),
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
                    borderRadius: BorderRadius.circular(16.0),
                  ))),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.02),
                      blurRadius: 3.0,
                      offset: Offset(0, 0),
                      spreadRadius: 0)
                ]),
            child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  child: Image.network(
                      'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                  borderRadius: BorderRadius.circular(16.0),
                )),
          )
        ],
      ),
    );
  }
}

// Favorite Button
class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => {
              setState(() {
                isFavorite = !isFavorite;
              })
            },
        icon: Icon(isFavorite ?  Icons.favorite :  Icons.favorite_border, color: Colors.red,));
  }
}
