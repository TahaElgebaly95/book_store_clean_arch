import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../view_model/all_products_cubit/all_books_products_cubit.dart';

class BooksHeader extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClearSearch;

  const BooksHeader({
    super.key,
    required this.controller,
    required this.onSearchChanged,
    required this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Search Bar
          SearchBar(
            controller: controller,
            onChanged: onSearchChanged,
            hintText: 'Search for a book...',
            leading: const Icon(Icons.search),
            onSubmitted: (value) {
              onSearchChanged(value);
            },
           
            textInputAction: TextInputAction.search,
            trailing: [
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: onClearSearch,
              ),
            ],
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16.w),
            ),
            elevation: const WidgetStatePropertyAll(1),
          ),

          SizedBox(height: 12.h),

          // Results Count
          BlocBuilder<AllBooksProductsCubit, AllBooksProductsState>(
            builder: (context, state) {
              if (state is AllBooksProductsSuccessState) {
                return Row(
                  children: [
                    Icon(Icons.book, size: 20.sp, color: Colors.grey[600]),
                    SizedBox(width: 8.w),
                    TextCustom(
                      text: '${state.filteredProducts.length} Books Found',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
