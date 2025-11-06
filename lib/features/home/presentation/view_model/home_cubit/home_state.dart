part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<CategoryEntity> categories;
  final List<ProductEntity> bestSellers;
  final List<ProductEntity> newArrivals;
  final List<SliderEntity> sliders;

  const HomeLoaded({
    required this.categories,
    required this.bestSellers,
    required this.newArrivals,
    required this.sliders,
  });

  @override
  List<Object?> get props => [categories, bestSellers, newArrivals, sliders];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

class CategoryProductsLoading extends HomeState {
  const CategoryProductsLoading();
}

class CategoryProductsLoaded extends HomeState {
  final List<ProductEntity> products;

  const CategoryProductsLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class CategoryProductsError extends HomeState {
  final String message;

  const CategoryProductsError(this.message);

  @override
  List<Object?> get props => [message];
}