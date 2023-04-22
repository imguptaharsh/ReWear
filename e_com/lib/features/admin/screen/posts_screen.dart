import 'package:e_com/common/widgets/loader.dart';
import 'package:e_com/constants/global_variable.dart';
import 'package:e_com/features/account/widgets/single_product.dart';
import 'package:e_com/features/admin/screen/add_product_screen.dart';
import 'package:e_com/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProduct.routeName);
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            // backgroundColor: Color.fromARGB(255, 195, 190, 187),
            body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Column(children: [
                    SizedBox(
                        // color: Color.fromARGB(255, 195, 190, 187),
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Text(
                          productData.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                        IconButton(
                            onPressed: () => deleteProduct(productData, index),
                            icon: const Icon(Icons.delete)),
                      ],
                    )
                  ]);
                }),
            floatingActionButton: FloatingActionButton(
                backgroundColor: GlobalVariables.selectedNavBarColor,
                onPressed: navigateToAddProduct,
                tooltip: 'Add a product!',
                foregroundColor: Colors.white,
                child: const Icon(Icons.add)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
