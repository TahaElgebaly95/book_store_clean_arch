import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/all_products_cubit/all_books_products_cubit.dart';
import 'books_empty_state.dart';
import 'books_error_state.dart';
import 'books_header.dart';
import 'books_list.dart';
import 'books_listeners.dart';
import 'books_loading_state.dart';


class BooksViewBody extends StatefulWidget {
  const BooksViewBody({super.key});

  @override
  State<BooksViewBody> createState() => _BooksViewBodyState();
}

class _BooksViewBodyState extends State<BooksViewBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _fetchBooks() => context.read<AllBooksProductsCubit>().getAllProducts();

  void _onSearchChanged(String query) {
    context.read<AllBooksProductsCubit>().searchProductsByName(query);
  }

  void _onClearSearch() {
    _searchController.clear();
    context.read<AllBooksProductsCubit>().resetProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BooksListeners(
      child: Column(
        children: [
          BooksHeader(
            controller: _searchController,
            onSearchChanged: _onSearchChanged,
            onClearSearch: _onClearSearch,
          ),
          Expanded(
            child: BlocBuilder<AllBooksProductsCubit, AllBooksProductsState>(
              builder: (context, state) => _buildBooksState(state),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBooksState(AllBooksProductsState state) {
    return switch (state) {
      AllBooksProductsLoadingState() => const BooksLoadingState(),
      AllBooksProductsErrorState() => BooksErrorState(
        message: state.error,
        onRetry: _fetchBooks,
      ),
      AllBooksProductsSuccessState()
      when state.filteredProducts.isNotEmpty =>
          BooksList(products: state.filteredProducts),
      _ => const BooksEmptyState(),
    };
  }
}