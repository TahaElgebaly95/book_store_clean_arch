import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/silder_entity.dart';

class SlidersSection extends StatelessWidget {
  final List<SliderEntity> sliders;

  const SlidersSection({required this.sliders, super.key});

  @override
  Widget build(BuildContext context) {
    if (sliders.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CarouselSlider.builder(
        itemCount: sliders.length,
        itemBuilder: (context, index, _) => ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            sliders[index].imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey[300],
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey[300],
              child: Icon(
                Icons.broken_image_rounded,
                size: 48.sp,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          height: 180.h,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
        ),
      ),
    );
  }
}