import 'package:e_com/common/widgets/loader.dart';
import 'package:e_com/features/home/services/home_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// import '../../../common/widgets/loader.dart';
import '../../../constants/global_variable.dart';
import '../../../models/product.dart';
import '../../product_details/screen/product_details_screen.dart';

class CategoryDealScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealScreen({super.key, required this.category});

  @override
  State<CategoryDealScreen> createState() => _CategoryDealScreenState();
}

class _CategoryDealScreenState extends State<CategoryDealScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 250, 235),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(padding.top),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shopping for ${widget.category}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: newheight - 100,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(left: 10),
                      itemCount: productList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2.2,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductDetailScreen.routeName,
                              arguments: product,
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 160,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 0.3,
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Image.network(
                                          product.images[0],
                                          fit: BoxFit.contain,
                                          height: 135,
                                          width: 135,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 235,
                                              // height: 10,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                product.name,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                maxLines: 2,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 235,
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 5),
                                              child: Text(
                                                '₹${product.price}',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                            Container(
                                              width: 235,
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: const Text(
                                                  'Eligible for FREE Shipping'),
                                            ),
                                            Container(
                                              width: 235,
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 5),
                                              child: const Text(
                                                'In Stock',
                                                style: TextStyle(
                                                  color: Colors.teal,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
