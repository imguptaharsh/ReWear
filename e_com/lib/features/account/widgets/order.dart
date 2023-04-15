import 'package:e_com/features/account/widgets/single_product.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants/global_variable.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfHupo1J4cgHeO09iNkM7_xbNJSxnwNLbeDYN2DICTPNASYTj7t4fWu6HB5Qubu2TOzQw&usqp=CAU'
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGdxa4k35D4mMBnfryUTMzLvXkqpDnjh3z7g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGdxa4k35D4mMBnfryUTMzLvXkqpDnjh3z7g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGdxa4k35D4mMBnfryUTMzLvXkqpDnjh3z7g&usqp=CAU',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: const Text(
                'See all',
                style: TextStyle(
                  color: Color.fromARGB(255, 3, 156, 202),
                ),
              ),
            ),
          ],
        ),
        Container(
            height: 140,
            padding: const EdgeInsets.only(
              left: 10,
              top: 20,
              right: 0,
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return SingleProduct(
                    image: list[index],
                  );
                }))
      ],
    );
  }
}
