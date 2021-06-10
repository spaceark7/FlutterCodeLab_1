import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String category;
  final String imagePath;

  CardItem({required this.category, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath),
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter)),
        child: Text(
          category,
          style: TextStyle(
              fontSize: 26.0,
              fontFamily: "Bebas",
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
