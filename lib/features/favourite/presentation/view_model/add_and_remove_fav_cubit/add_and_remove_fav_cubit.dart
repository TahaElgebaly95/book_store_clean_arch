import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/fav_model.dart';
import '../../../domain/use_cases/add_fav_use_case.dart';
import '../../../domain/use_cases/remove_fav_use_case.dart';

part 'add_and_remove_fav_state.dart';

class AddOrRemoveFavCubit extends Cubit<AddOrRemoveFavState> {
  AddOrRemoveFavCubit(this.addFavouriteUseCase, this.removeFavUseCase)
    : super(AddToFavInitialState());
  final AddFavouriteUseCase addFavouriteUseCase;
  final RemoveFavUseCase removeFavUseCase;

  Future<void> addToFavourite(int id) async {
    emit(AddToFavLoadingState());
    final result = await addFavouriteUseCase.call(id);
    result.fold(
      (failure) => emit(AddToFavErrorState(failure.errMessage)),
      (favouriteModel) => emit(AddToFavSuccessState(favouriteModel)),
    );
  }

  Future<void> removeFavProduct(int id) async {
    emit(RemoveFavLoadingState());
    final result = await removeFavUseCase.removeFavProduct(id);
    result.fold(
      (failure) => emit(RemoveFavErrorState(failure.errMessage)),
      (favouriteModel) => emit(RemoveFavSuccessState(favouriteModel)),
    );
  }
}
