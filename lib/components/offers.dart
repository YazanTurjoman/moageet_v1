import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

Widget offers(context) {
  return ImageSlideshow(
    width: double.infinity,
    height: MediaQuery.of(context).size.height / 4,
    initialPage: 0,
    indicatorColor: const Color(0xff14586E),
    indicatorBackgroundColor: const Color(0xffB5B5B5),
    autoPlayInterval: 3000,
    isLoop: true,
    children: [
      Image.asset(
        'assets/img/img1.jpg',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/img/img2.jpg',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/img/img3.jpg',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/img/img4.jpg',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/img/img5.jpg',
        fit: BoxFit.fill,
      ),
    ],
  );
}
