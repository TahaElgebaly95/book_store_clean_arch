import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_custom.dart';
import '../../../../core/utils/colors.dart';
import 'widgets/contact_us_view_body.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

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
          text: 'Contact Us',
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      body: const ContactUsViewBody(),
    );
  }
}