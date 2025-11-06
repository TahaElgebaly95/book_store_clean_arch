import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/model/fav_model.dart';
import '../../data/repo/fav_repo.dart';

class AddFavouriteUseCase {
  final FavouriteRepo favouriteRepo;

  AddFavouriteUseCase(this.favouriteRepo);

  Future<Either<Failure, FavouriteModel>> call(int id) {
    return favouriteRepo.addFavourite(id);
  }
}