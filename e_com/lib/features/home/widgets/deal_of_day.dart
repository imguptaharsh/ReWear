import 'package:e_com/common/widgets/loader.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../product_details/screen/product_details_screen.dart';
import '../services/home_services.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 40, top: 20, bottom: 10),
                      child: const Text(
                        'Green Pick of the Day',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          product!.images[0],
                          height: 265,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        product!.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: RichText(
                            text: TextSpan(
                              text: 'Deal Price:  ',
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: '₹${product!.price}',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    )
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   padding:
                    //       const EdgeInsets.only(left: 15, top: 5, right: 40),
                    //   child: const Text(
                    //     'Sustainable',
                    //     maxLines: 2,
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: product!.images
                    //         .map(
                    //           (e) => Image.network(
                    //             e,
                    //             fit: BoxFit.fitWidth,
                    //             width: 100,
                    //             height: 100,
                    //           ),
                    //         )
                    //         .toList(),
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     vertical: 15,
                    //   ).copyWith(left: 15),
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     'See all deals',
                    //     style: TextStyle(
                    //       color: Colors.cyan[800],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
  }
}
