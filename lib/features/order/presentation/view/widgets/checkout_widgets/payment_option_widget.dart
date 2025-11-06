import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';

class PaymentOptionWidget extends StatelessWidget {
  final String value;
  final String title;
  final IconData icon;
  final String groupValue;
  final Function(String) onChanged;

  const PaymentOptionWidget({
    super.key,
    required this.value,
    required this.title,
    required this.icon,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = groupValue == value;
    
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.primaryColor.withAlpha(100)
              : Colors.grey[50],
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey[300]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryColor : Colors.grey[600],
              size: 24.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: TextCustom(
                text: title,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primaryColor : AppColors.kBlack,
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: (val) => onChanged(val!),
              activeColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}