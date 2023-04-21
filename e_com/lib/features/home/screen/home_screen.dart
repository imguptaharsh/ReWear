import 'package:e_com/features/home/widgets/carousel_image.dart';
import 'package:e_com/features/home/widgets/deal_of_day.dart';
import 'package:e_com/features/home/widgets/top_cat.dart';
import 'package:e_com/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variable.dart';
import '../../search/screen/search_screen.dart';
import '../widgets/address_box.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
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
                                contentPadding: const EdgeInsets.only(top: 10),
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
              Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(Icons.mic, color: Colors.black, size: 25)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        //  scrollDirection: Axis.vertical
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            TopCategories(),
            AddressBox(),
            // SizedBox(
            //   height: 10,
            // ),
            CarouselImage(),
            DealOfDay(),
            // AddressBox(),
          ],
        ),
      ),
      // const AddressBox(),
    );
  }
}
