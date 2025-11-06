// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomClipPath extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(1, size.height - 70.h);
//     path.quadraticBezierTo(
//         size.width / 2.w,
//         size.height.h,
//         size.width.w,
//         size.height - 60.h);
//     path.lineTo(size.width, 0.w);
//     path.close();
//     path.lineTo(size.width,0.w);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }