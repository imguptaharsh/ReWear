// import 'package:e_com/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({super.key, required this.rating});
  Color colorTemp() {
    if (rating <= 1) {
      return const Color.fromARGB(255, 253, 19, 3);
    } else if (rating <= 2) {
      return const Color.fromARGB(255, 220, 72, 9);
    } else if (rating <= 3) {
      return Colors.yellow;
    } else if (rating <= 4) {
      return const Color.fromARGB(255, 209, 250, 3);
    } else {
      return const Color.fromARGB(255, 6, 145, 11);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        direction: Axis.horizontal,
        itemCount: 5,
        rating: rating,
        itemSize: 15,
        itemBuilder: (context, index) =>
            const Icon(Icons.square, color: Color.fromARGB(255, 236, 162, 13)));
  }
}
