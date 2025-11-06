import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../data/model/faq_model.dart';

class FaqItemCard extends StatefulWidget {
  final FaqItemModel faq;

  const FaqItemCard({super.key, required this.faq});

  @override
  State<FaqItemCard> createState() => _FaqItemCardState();
}

class _FaqItemCardState extends State<FaqItemCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: _toggleExpanded,
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.help_outline,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextCustom(
                      text: widget.faq.question,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.5).animate(_animation),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.primaryColor,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _animation,
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 1.h, color: Colors.grey[300]),
                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 18.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: TextCustom(
                          text: widget.faq.answer,
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  // if (widget.faq.category != null) ...[
                  //   SizedBox(height: 12.h),
                  //   Container(
                  //     padding: EdgeInsets.symmetric(
                  //       horizontal: 10.w,
                  //       vertical: 4.h,
                  //     ),
                  //     decoration: BoxDecoration(
                  //       color: Colors.blue[50],
                  //       borderRadius: BorderRadius.circular(6.r),
                  //       border: Border.all(color: Colors.blue[200]!),
                  //     ),
                  //     child: TextCustom(
                  //       text: widget.faq.category!,
                  //       fontSize: 11.sp,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.blue[700],
                  //     ),
                  //   ],
                  // ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
