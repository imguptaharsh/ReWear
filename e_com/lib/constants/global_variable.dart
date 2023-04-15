import 'package:flutter/material.dart';

String uri = 'http://10.0.9.227:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    // colors: [
    //   Colors.cyan,
    //   Colors.indigo,
    // ],
    // stops: [
    //   0.3,
    //   1.0,
    // ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.indigo,
      Colors.cyan,
    ],
  );

  static const secondaryColor = Colors.indigo;
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static const selectedNavBarColor = Colors.cyan;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://as1.ftcdn.net/v2/jpg/03/20/68/66/1000_F_320686681_Ur6vdYQgDC9WiijiVfxlRyQffxOgfeFz.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
    'https://img.freepik.com/free-vector/flat-horizontal-sale-banner-template-with-photo_23-2149000923.jpg?w=1480&t=st=1680633256~exp=1680633856~hmac=aa8a12634b07996291007efba6e3d25d9e45a8ab2f1ca0989c089f9e3e5310c1'
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Hoodie',
      'image': 'assets/images/hoodie.png',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/t-shirt.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];
}
