import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travelapp/model/category_list.dart';

class CarouselView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: SlideAsset.map((e) {
          return Builder(builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                e,
                fit: BoxFit.fitWidth,
              ),
            );
          });
        }).toList(),
        options: CarouselOptions(
            autoPlay: true,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal));
  }
}
