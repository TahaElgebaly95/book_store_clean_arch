import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/all_products_books.dart';
import '../../../data/repo/all_products_repo.dart';
import '../../../domain/use_cases/get_all_products_use_case.dart';

part 'all_books_products_state.dart';

class AllBooksProductsCubit extends Cubit<AllBooksProductsState> {
  AllBooksProductsCubit(this.allProductsRepo)
    : super(AllBooksProductsInitialState());

  static AllBooksProductsCubit get(context) => BlocProvider.of(context);
  final AllProductsRepo allProductsRepo;

  List<ProductModel> _originalProducts = [];

  Future<void> getAllProducts() async {
    emit(AllBooksProductsLoadingState());
    final result = await GetAllProductsUseCase(allProductsRepo).call();
    result.fold(
      (failure) => emit(AllBooksProductsErrorState(error: failure.errMessage)),
      (allProductsModel) {
        final allProductsList = allProductsModel.data.products;
        _originalProducts = allProductsList;
        emit(
          AllBooksProductsSuccessState(
            allProducts: allProductsList,
            filteredProducts: allProductsList,
          ),
        );
      },
    );
  }

  void searchProductsByName(String query) {
    if (state is AllBooksProductsSuccessState) {
      if (query.isEmpty) {
        emit(
          AllBooksProductsSuccessState(
            allProducts: _originalProducts,
            filteredProducts: _originalProducts,
          ),
        );
        return;
      }

      final lowerCaseQuery = query.toLowerCase();

      final results =
          _originalProducts.where((product) {
            return product.name.toLowerCase().contains(lowerCaseQuery);
          }).toList();

      emit(
        AllBooksProductsSuccessState(
          allProducts: _originalProducts,
          filteredProducts: results,
        ),
      );
    }
  }

  // ----------------------------------------------------
  void resetProducts() {
    if (state is AllBooksProductsSuccessState) {
      emit(
        AllBooksProductsSuccessState(
          allProducts: _originalProducts,
          filteredProducts: _originalProducts,
        ),
      );
    }
  }
}
