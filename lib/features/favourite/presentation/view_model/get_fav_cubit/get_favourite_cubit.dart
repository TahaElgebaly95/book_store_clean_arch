import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/fav_model.dart';
import '../../../data/repo/fav_repo.dart';
import '../../../domain/use_cases/get_fav_use_case.dart';

part 'get_favourite_state.dart';

class GetFavouriteCubit extends Cubit<GetFavouriteState> {
  GetFavouriteCubit(this.favouriteRepo) : super(GetFavouriteInitialState());
  final FavouriteRepo favouriteRepo;

  static GetFavouriteCubit get(context) => BlocProvider.of(context);

  Future<void> getFavourite() async {
    emit(GetFavouriteLoadingState());
    final result = await GetFavouriteUseCase(favouriteRepo).call();
    result.fold(
      (failure) => emit(GetFavouriteErrorState(failure.errMessage)),
      (favouriteModel) => emit(GetFavouriteSuccessState(favouriteModel)),
    );
  }

  bool isProductFavourite(int productId) {
    // 1. الحصول على الحالة الحالية للكيوبت
    final currentState = state;

    // 2. التحقق مما إذا كانت الحالة هي حالة النجاح (GetFavouriteSuccessState)
    if (currentState is GetFavouriteSuccessState) {
      // 3. البحث في قائمة المفضلة الموجودة داخل الـ state
      // (نفترض أن المسار هو favouriteModel.data.favorites.product.id)
      return currentState.favouriteModel.data?.dataFavItem?.any(
            (favItem) => favItem.id == productId,
          ) ??
          false;
    }

    // 4. في حالة عدم وجود بيانات (Initial, Loading, Error)، تعتبر غير مفضلة
    return false;
  }
}
