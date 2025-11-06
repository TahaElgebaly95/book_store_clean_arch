import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/entities/silder_entity.dart';
import '../../../domain/use_cases/get_best_seller_use_case.dart';
import '../../../domain/use_cases/get_categories_use_csae.dart';
import '../../../domain/use_cases/get_category_product_use_case.dart';
import '../../../domain/use_cases/get_new_arrival_use_case.dart';
import '../../../domain/use_cases/get_slider_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetCategoryProductsUseCase _getCategoryProductsUseCase;
  final GetBestSellersUseCase _getBestSellersUseCase;
  final GetNewArrivalsUseCase _getNewArrivalsUseCase;
  final GetSlidersUseCase _getSlidersUseCase;

  HomeCubit({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetCategoryProductsUseCase getCategoryProductsUseCase,
    required GetBestSellersUseCase getBestSellersUseCase,
    required GetNewArrivalsUseCase getNewArrivalsUseCase,
    required GetSlidersUseCase getSlidersUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getCategoryProductsUseCase = getCategoryProductsUseCase,
        _getBestSellersUseCase = getBestSellersUseCase,
        _getNewArrivalsUseCase = getNewArrivalsUseCase,
        _getSlidersUseCase = getSlidersUseCase,
        super(const HomeInitial());

  Future<void> loadHomeData() async {
    emit(const HomeLoading());

    try {
      // Load data separately to avoid type inference issues
      final categoriesResult = await _getCategoriesUseCase();
      final bestSellersResult = await _getBestSellersUseCase();
      final newArrivalsResult = await _getNewArrivalsUseCase();
      final slidersResult = await _getSlidersUseCase();

      // Check if any failed
      if (categoriesResult.isLeft() ||
          bestSellersResult.isLeft() ||
          newArrivalsResult.isLeft() ||
          slidersResult.isLeft()) {
        emit(const HomeError('Failed to load home data'));
        return;
      }

      // Extract data with explicit types
      final categories = categoriesResult.getOrElse(() => <CategoryEntity>[]);
      final bestSellers = bestSellersResult.getOrElse(() => <ProductEntity>[]);
      final newArrivals = newArrivalsResult.getOrElse(() => <ProductEntity>[]);
      final sliders = slidersResult.getOrElse(() => <SliderEntity>[]);

      emit(HomeLoaded(
        categories: categories,
        bestSellers: bestSellers,
        newArrivals: newArrivals,
        sliders: sliders,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> loadCategoryProducts(int categoryId) async {
    emit(const CategoryProductsLoading());

    final result = await _getCategoryProductsUseCase(categoryId);

    result.fold(
          (failure) => emit(CategoryProductsError(failure.errMessage)),
          (products) => emit(CategoryProductsLoaded(products)),
    );
  }
}