import 'package:flutter/material.dart';

import '../../../constants/global_variable.dart';
import '../widgets/below_app_bar.dart';
import '../widgets/orders.dart';
import '../widgets/top_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 222, 222),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 15,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/rewear3.png',
                    // fit: BoxFit.fitHeight,
                    width: 120,
                    height: 40,
                    // color: Colors.black,
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.notifications_outlined),
                      ),
                      Icon(Icons.search),
                    ],
                  ))
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 251, 248, 219),
        child: Column(
          children: const [
            BelowAppBar(),
            // Profile(),
            SizedBox(height: 10),
            TopButtons(),
            SizedBox(height: 20),
            Orders(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
}
