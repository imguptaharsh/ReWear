import 'package:flutter/material.dart';

String uri = 'http://10.0.9.227:3000';

// 192.168.29.31
// 10.0.9.227
class GlobalVariables {
  var kTextColor = const Color(0xFF535353);
  var kTextLightColor = const Color(0xFFACACAC);
  var kDefaultPaddin = 20.0;
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
      Color.fromARGB(255, 250, 227, 25),
      Color.fromARGB(255, 233, 228, 190),
    ],
  );

  static const secondaryColor = Colors.green;
  static const mainColor = Color.fromARGB(255, 250, 227, 25);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static const selectedNavBarColor = Color.fromARGB(255, 233, 228, 190);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    // 'assets/images/frontPoster.png',
    'assets/images/p5.jpeg',
    'assets/images/p2.jpeg',
    'assets/images/p3.jpeg',
    'assets/images/p4.jpeg',

    // 'https://as1.ftcdn.net/v2/jpg/03/20/68/66/1000_F_320686681_Ur6vdYQgDC9WiijiVfxlRyQffxOgfeFz.jpg',
    // 'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    // 'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    // 'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    // 'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
    // 'https://img.freepik.com/free-vector/flat-horizontal-sale-banner-template-with-photo_23-2149000923.jpg?w=1480&t=st=1680633256~exp=1680633856~hmac=aa8a12634b07996291007efba6e3d25d9e45a8ab2f1ca0989c089f9e3e5310c1'
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Men',
      'image': 'assets/images/man.png',
    },
    {
      'title': 'Women',
      'image': 'assets/images/women.png',
    },
    {
      'title': 'kids',
      'image': 'assets/images/kid.png',
    },
    // {
    //   'title': 'Kids',
    //   'image': 'assets/images/kid.png',
    // },
    {
      'title': 'Shoes',
      'image': 'assets/images/shoes.png',
    },
    // {
    //   'title': 'Offers/Sales',
    //   'image': 'assets/images/offer.png',
    // },
  ];
}
