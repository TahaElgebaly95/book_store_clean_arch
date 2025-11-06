import 'package:book_store_mvvm/features/faq/presentation/view/widgets/faq_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_custom.dart';
import '../../../../core/utils/colors.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.kBlack),
        centerTitle: true,
        title: TextCustom(
          text: 'FAQ',
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      body: const FaqViewBody(),
    );
  }
}