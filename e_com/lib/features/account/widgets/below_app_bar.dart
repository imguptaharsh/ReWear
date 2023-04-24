import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variable.dart';
import '../../../provider/user_provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
        // decoration: const BoxDecoration(
        //   gradient: GlobalVariables.appBarGradient,
        // ),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          "https://www.w3schools.com/howto/img_avatar.png"),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // RichText(
            //   text: TextSpan(
            //       text: 'Hello ',
            //       style: const TextStyle(
            //         fontSize: 22,
            //         color: Colors.black,
            //       ),
            //       children: [
            //         TextSpan(
            //             text: user.name,
            //             style: const TextStyle(
            //                 fontSize: 22,
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.w600)),
            //       ]),
            // ),
          ],
        ));
  }
}
