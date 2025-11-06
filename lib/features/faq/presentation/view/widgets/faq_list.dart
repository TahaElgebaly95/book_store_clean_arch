import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/model/faq_model.dart';
import 'faq_item_card.dart';

class FaqList extends StatelessWidget {
  final List<FaqItemModel> faqs;

  const FaqList({super.key, required this.faqs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        return FaqItemCard(faq: faqs[index]);
      },
    );
  }
}