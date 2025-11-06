import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class CarouselSliderCustom {
  List<Widget> items;
  final CarouselOptions carouselOptions;
  dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  void callbackFunction(int index, CarouselPageChangedReason reason) {
    if (onPageChanged != null) {
      onPageChanged!(index, reason);
    }
  }

  CarouselSliderCustom({required this.items, required this.carouselOptions});

  void initCarouselSlider() {
    CarouselSlider(
        items: items,
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ));
  }
}
