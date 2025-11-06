import 'package:book_store_mvvm/core/components/widgets/text_custom.dart';
import 'package:book_store_mvvm/core/utils/routing/routs.dart';
import 'package:book_store_mvvm/features/books/presentation/view/widgets/books_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  TextCustom(text: 'Books',fontWeight: FontWeight.bold,fontSize: 25.sp,),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pushReplacement(Routs.bottomNavBarRoute),
        ),
      ),
      body: BooksViewBody(),
    );
  }
}
