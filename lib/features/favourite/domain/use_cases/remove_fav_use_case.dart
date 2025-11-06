import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/model/fav_model.dart';
import '../../data/repo/fav_repo.dart';

class RemoveFavUseCase {
  final FavouriteRepo favouriteRepo;

  RemoveFavUseCase(this.favouriteRepo);

  Future<Either<Failure, FavouriteModel>> removeFavProduct(int id) async {
    return favouriteRepo.removeFavProduct(id);
  }
}
