import 'package:book_store_mvvm/features/favourite/data/repo/fav_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/model/fav_model.dart';

class GetFavouriteUseCase {
  final FavouriteRepo favouriteRepo;

  const GetFavouriteUseCase(this.favouriteRepo);

  Future<Either<Failure, FavouriteModel>> call() async {
    return await favouriteRepo.getFavourite();
  }
}
