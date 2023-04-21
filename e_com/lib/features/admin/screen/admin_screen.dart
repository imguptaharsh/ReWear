import 'package:e_com/features/admin/screen/posts_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variable.dart';
import '../../account/services/account_services.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text('Cart Page'),
    ),
    const Center(
      child: Text('Cart Page'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("ReWear",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              GestureDetector(
                onTap: () => AccountServices().logOut(context),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: const [
                        Icon(Icons.logout_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Admin",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    )
                    // child: Image.asset(
                    //   'assets/images/amazon_in.png',
                    //   width: 120,
                    //   height: 45,
                    //   color: Colors.black,
                    // )
                    ),
              ),
              // Container(
              //     padding: const EdgeInsets.only(left: 15, right: 5),
              //     child: Row(
              //       children: const [
              //         Padding(
              //           padding: EdgeInsets.only(right: 15),
              //           child: Icon(Icons.notifications_outlined),
              //         ),
              //         // Icon(Icons.admin_panel_settings_rounded),
              //       ],
              //     ),
              // )
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.secondaryColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //Post
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 0
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.home),
            ),
            label: '',
          ),
          //Analytics
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 1
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(
                Icons.analytics_outlined,
              ),
            ),
            label: '',
          ),
          //Order
          BottomNavigationBarItem(
            icon: Container(
                width: bottomBarwidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.all_inbox_outlined,
                )),
            label: '',
          ),
        ],
      ),
    );
  }
}
