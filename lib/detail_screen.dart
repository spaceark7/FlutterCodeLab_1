import 'package:flutter/material.dart';
import 'package:travelapp/model/category_list.dart';

class DetailScreen extends StatelessWidget {
  final ItemsFashion product;

  DetailScreen({required this.product});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 575) {
        return DetailMobilePage(product: product);
      } else {
        return DetailWebPage(product: product);
      }
    });
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
  final List<String> photos;

  ImageContainerScroll({required this.photos});

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
                    child: Image.asset(photos[0])),
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
                    child: Image.asset(photos[1]),
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
                  child: Image.asset(photos[2]),
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
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}

// Scrren Size Section

class DetailMobilePage extends StatelessWidget {
  final ItemsFashion product;

  const DetailMobilePage({required this.product});

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
          ImageContainerScroll(
            photos: product.itemsPhoto,
          ),
        ],
      ),
    )));
  }
}

class DetailWebPage extends StatefulWidget {
  final ItemsFashion product;

  const DetailWebPage({required this.product});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 64),
          child: Center(
            child: Container(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: CircleAvatar(
                        backgroundColor: Colors.black26,
                        child: IconButton(
                            onPressed: () => {Navigator.pop(context)},
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          widget.product.name,
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ))
                  ]),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.asset(widget.product.imagePath),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                  height: 100,
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Scrollbar(
                                    isAlwaysShown: true,
                                    controller: _scrollController,
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        controller: _scrollController,
                                        children:
                                            widget.product.itemsPhoto.map((e) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12
                                                          .withOpacity(0.02),
                                                      blurRadius: 3.0,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 0)
                                                ]),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: ClipRRect(
                                                  child: Image.asset(e),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                )),
                                          );
                                        }).toList()),
                                  ))
                            ],
                          )),
                      Expanded(
                          child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  widget.product.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.checkroom),
                                      SizedBox(width: 8.0),
                                      Text(widget.product.category)
                                    ],
                                  ),
                                  FavoriteButton(),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.palette),
                                  SizedBox(width: 8.0),
                                  Text(widget.product.color)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.monetization_on),
                                  SizedBox(width: 8.0),
                                  Text("\$ ${widget.product.price}")
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  widget.product.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 16.0, fontFamily: "Montserrat"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          )),
    )));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
