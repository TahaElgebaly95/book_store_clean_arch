import 'package:book_store_mvvm/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/text_custom.dart';

class SlideText extends StatelessWidget {
  const SlideText({super.key, required this.slidingAnimation});
  final Animation<Offset> slidingAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder:
          (context, child) => SlideTransition(
        position: slidingAnimation,
        child: TextCustom(
          text: 'Book Store',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
