import 'package:e_com/features/account/widgets/single_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../constants/global_variable.dart';
import '../../../models/order.dart';
import '../../order_details.dart/order_details.dart';
import '../services/account_services.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: const Text(
                      'Your Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 15, bottom: 15),
                    // ignore: prefer_const_constructors
                    child: Text(
                      'See all',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              // display orders
              Container(
                height: 230,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          OrderDetails.routeName,
                          arguments: orders![index],
                        );
                      },
                      child: SingleProduct(
                        image: orders![index].products[0].images[0],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
