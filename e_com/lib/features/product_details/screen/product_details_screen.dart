import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_com/features/cart/screen/cart_screen.dart.dart';
import 'package:e_com/features/product_details/services/product_details_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../common/stars.dart';
import '../../../constants/global_variable.dart';
import '../../../models/product.dart';
import '../../../provider/user_provider.dart';
import '../../search/screen/search_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  static const String routeName = '/product-details';
  final Product product;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void addToCart() {
    productDetailsServices.addToCart(context: context, product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    const kTextColor = Color(0xFF535353);
    Color colorTemp() {
      if (myRating <= 1) {
        return const Color.fromARGB(255, 253, 19, 3);
      } else if (myRating <= 2) {
        return const Color.fromARGB(255, 220, 72, 9);
      } else if (myRating <= 3) {
        return Colors.yellow;
      } else if (myRating <= 4) {
        return const Color.fromARGB(255, 209, 250, 3);
      } else {
        return const Color.fromARGB(255, 6, 145, 11);
      }
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 246, 211),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      height: 42,
                      margin: const EdgeInsets.only(left: 15),
                      child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 1,
                          child: TextFormField(
                              onFieldSubmitted: navigateToSearchScreen,
                              decoration: InputDecoration(
                                  prefixIcon: InkWell(
                                      onTap: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          left: 6,
                                        ),
                                        child: Icon(Icons.search,
                                            color: Colors.black, size: 23),
                                      )),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Search..',
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(top: 10),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black38,
                                      width: 1,
                                    ),
                                  ))))),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const CartScreen(),
                      ),
                    ),
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 42,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Product id:'),
                    Text(
                      widget.product.id!,
                    ),
                    Stars(rating: avgRating),
                  ]),
            ),
            // ignore: prefer_const_constructors

            CarouselSlider(
              items: widget.product.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),
            Container(
                // ignore: prefer_const_constructors
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: const BorderRadius.only(
                //     topLeft: Radius.circular(24),
                //     topRight: Radius.circular(24),
                //   ),
                // // ),
                // color: Colors.white,
                // height: 10,
                // margin: EdgeInsets.only(3),
                //       padding: EdgeInsets.only(
                //         top: size.height * 0.12,
                //         left: kDefaultPaddin,
                //         right: kDefaultPaddin,
                //       ),
                ),

            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Text(widget.product.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: RichText(
                      text: TextSpan(
                        text: 'Deal Price: ',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: '₹${widget.product.price}',
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.red,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(color: Colors.white, child: ColorBar(kTextColor)),

            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.description,
                      style: const TextStyle(height: 1.5),
                    ),
                  ),
                ],
              ),
              // height: 50,
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 50,
                    width: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.yellow,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add_shopping_cart_outlined),
                      color: Colors.black,
                      onPressed: addToCart,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green,
                          backgroundColor: GlobalVariables.mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const CartScreen(),
                          ),
                        ),
                        child: Text(
                          "Buy  Now".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.black12,
              height: 5,
            ),

            RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => Icon(
                Icons.circle,
                color: colorTemp(),
              ),
              // onRatingUpdate: (rating) {},
              onRatingUpdate: (rating) {
                productDetailsServices.rateProduct(
                  context: context,
                  product: widget.product,
                  rating: rating,
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        )));
  }

  // ignore: non_constant_identifier_names
  Row ColorBar(Color kTextColor) {
    const kTextColor = Color(0xFF535353);
    // const kTextLightColor = Color(0xFFACACAC);

    // const kDefaultPaddin = 20.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Color"),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const ColorDot(
                    color: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  const ColorDot(
                    color: Color(0xFFF8C078),
                  ),
                  const ColorDot(
                    color: Color(0xFFA29B9B),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: kTextColor),
              children: [
                // ignore: prefer_const_constructors
                TextSpan(text: "Qty\n"),
                TextSpan(
                  text: '${widget.product.quantity.toInt()}',
                  style: const TextStyle(
                    fontSize: 15,
                    // color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  // ignore: use_key_in_widget_constructors
  const ColorDot({
    // required Key key,
    required this.color,
    // by default isSelected is false
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    const kDefaultPaddin = 20.0;
    return Container(
      // color: Colors.whdd,
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}





// Padding(
//               padding: const EdgeInsets.all(10),
//               child: CustomButton(
//                 text: 'Buy Now',
//                 onTap: () {},
//               ),
//             ),
//             const SizedBox(height: 10),
//             // ignore: prefer_const_constructors
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: CustomButton(
//                 text: 'Add to Cart',
//                 onTap: addToCart,
//                 color: const Color.fromARGB(255, 140, 129, 122),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               color: Colors.black12,
//               height: 5,
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: Text(
//                 'Rate The Product',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
