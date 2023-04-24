import 'package:e_com/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((i) {
        return Builder(
            builder: (BuildContext context) => Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Card(
                    child: Image.asset(
                      i,
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                ));
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
