import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travelapp/model/category_list.dart';

class CarouselView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: SliderAsset.map((item) {
          return Builder(builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Image.asset(
                item,
                fit: BoxFit.fitWidth,
              ),
            );
          });
        }).toList(),
        options:
            CarouselOptions(aspectRatio: 16 / 9, height: 300, initialPage: 0));
  }
}
