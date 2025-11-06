part of 'all_books_products_cubit.dart';

sealed class AllBooksProductsState extends Equatable {
  const AllBooksProductsState();

  @override
  List<Object> get props => [];
}

final class AllBooksProductsInitialState extends AllBooksProductsState {}

final class AllBooksProductsLoadingState extends AllBooksProductsState {}

final class AllBooksProductsSuccessState extends AllBooksProductsState {
  final List<ProductModel> allProducts;
  final List<ProductModel> filteredProducts;

  const AllBooksProductsSuccessState({
    required this.allProducts,
    required this.filteredProducts,
  });

  @override
  List<Object> get props => [allProducts, filteredProducts];
}

final class AllBooksProductsErrorState extends AllBooksProductsState {
  final String error;

  const AllBooksProductsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
