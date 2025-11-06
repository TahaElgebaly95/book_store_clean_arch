import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/faq_cubit/faq_cubit.dart';
import '../../view_model/faq_cubit/faq_state.dart';
import 'faq_search_bar.dart';
import 'faq_list.dart';
import 'faq_loading_state.dart';
import 'faq_empty_state.dart';
import 'faq_error_state.dart';

class FaqViewBody extends StatelessWidget {
  const FaqViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FaqSearchBar(),
        SizedBox(height: 16.h),
        Expanded(
          child: BlocBuilder<FaqCubit, FaqState>(
            builder: (context, state) {
              if (state is FaqLoading) {
                return const FaqLoadingState();
              }

              if (state is FaqSuccess) {
                return RefreshIndicator(
                  onRefresh: () => context.read<FaqCubit>().getAllFaqs(),
                  child: FaqList(faqs: state.faqs),
                );
              }

              if (state is FaqEmpty) {
                return const FaqEmptyState();
              }

              if (state is FaqError) {
                return FaqErrorState(
                  message: state.message,
                  onRetry: () => context.read<FaqCubit>().getAllFaqs(),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}