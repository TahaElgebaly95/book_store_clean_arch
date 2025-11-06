// lib/features/home/presentation/view/home_view.dart

import 'package:book_store_mvvm/features/home/presentation/view/widgets/home_appbar.dart';
import 'package:book_store_mvvm/features/home/presentation/view/widgets/home_drawer.dart';
import 'package:book_store_mvvm/features/home/presentation/view/widgets/states/home_error_state.dart';
import 'package:book_store_mvvm/features/home/presentation/view/widgets/states/home_loading_state.dart';
import 'package:book_store_mvvm/features/home/presentation/view/widgets/states/home_success_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/home_cubit/home_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    // Load home data only if not already loaded
    final cubit = context.read<HomeCubit>();
    if (cubit.state is! HomeLoaded) {
      cubit.loadHomeData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        toolbarHeight: 70.h,
        title: const HomeAppBar(),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const HomeLoadingState();
          }

          if (state is HomeError) {
            return HomeErrorState(
              message: state.message,
              onRetry: () => context.read<HomeCubit>().loadHomeData(),
            );
          }

          if (state is HomeLoaded) {
            return HomeSuccessState(state: state);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}