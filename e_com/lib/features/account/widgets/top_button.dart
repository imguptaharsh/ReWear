import 'package:e_com/features/account/widgets/account_button.dart';
import 'package:flutter/cupertino.dart';

import '../services/account_services.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Order', onTap: () {}),
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
            AccountButton(text: 'Turn Seller', onTap: () {}),
            AccountButton(text: 'Your WishList', onTap: () {}),
          ],
        )
      ],
    );
  }
}
