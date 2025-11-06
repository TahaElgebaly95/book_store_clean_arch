import 'package:book_store_mvvm/features/favourite/data/model/fav_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class FavouriteRepo {

  Future<Either<Failure,FavouriteModel>> getFavourite();
  Future<Either<Failure,FavouriteModel>> addFavourite(int id);
  Future<Either<Failure,FavouriteModel>> removeFavProduct(int id);
}