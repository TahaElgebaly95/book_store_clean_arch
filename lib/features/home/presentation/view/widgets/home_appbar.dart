
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/data/local/shared_helper.dart';
import '../../../../../../core/data/local/shared_keys.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = SharedHelper.get(key: SharedKey.name) ?? 'Guest';

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 2.h),
              Text(
                'What are you reading today?',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        CircleAvatar(
          radius: 24.r,
          backgroundColor: Colors.grey[300],
          backgroundImage: const AssetImage('assets/images/profile.jpg'),
        ),
      ],
    );
  }
}