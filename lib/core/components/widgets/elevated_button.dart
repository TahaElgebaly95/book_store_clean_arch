import 'package:book_store_mvvm/core/components/widgets/text_custom.dart';
import 'package:book_store_mvvm/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.nameOfButton,
    this.onPressed,
    super.key,
    this.backgroundColor,
  });

  final String nameOfButton;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 350.w,
      child: ElevatedButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: TextCustom(
          text: nameOfButton,
          color: AppColors.kWhite,
          decoration: TextDecoration.none,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
