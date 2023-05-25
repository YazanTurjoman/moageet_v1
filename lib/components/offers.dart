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
      Image.network(
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/ba/29/5c/img-worlds-of-adventure.jpg?w=1200&h=-1&s=1',
        fit: BoxFit.fill,
      ),
      Image.network(
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/ba/29/5c/img-worlds-of-adventure.jpg?w=1200&h=-1&s=1',
        fit: BoxFit.fill,
      ),
      Image.network(
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/ba/29/5c/img-worlds-of-adventure.jpg?w=1200&h=-1&s=1',
        fit: BoxFit.fill,
      ),
      Image.network(
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/ba/29/5c/img-worlds-of-adventure.jpg?w=1200&h=-1&s=1',
        fit: BoxFit.fill,
      ),
      Image.network(
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/ba/29/5c/img-worlds-of-adventure.jpg?w=1200&h=-1&s=1',
        fit: BoxFit.fill,
      ),
    ],
  );
}
