import 'package:e_com/features/account/widgets/account_button.dart';
import 'package:e_com/features/cart/screen/cart_screen.dart.dart';
import 'package:e_com/features/corbon/corbon.dart';
import 'package:e_com/features/corbon/newtemp.dart';
import 'package:flutter/material.dart';

import '../services/account_services.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  void navigateToCorbon(String query) {
    // Navigator.pushNamed(context, .routeName, arguments:
    // query);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
                text: 'Your Order',
                onTap: () => const CarbonFootprintCalculator()),
            AccountButton(
                text: 'Log Out ',
                onTap: () => AccountServices().logOut(context)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
                text: 'Corbon FootPrint',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const CarbonFootprintCalculator(),
                    ),
                  );
                }),
            AccountButton(text: 'Your WishList', onTap: () {}),
          ],
        ),
      ],
    );
  }
}
