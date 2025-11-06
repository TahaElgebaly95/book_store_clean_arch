import 'package:book_store_mvvm/core/errors/failures.dart';
import 'package:book_store_mvvm/features/favourite/data/data_sources/get_fav_remote_data_source.dart';
import 'package:book_store_mvvm/features/favourite/data/data_sources/remove_fav_remote_data_source.dart';
import 'package:book_store_mvvm/features/favourite/data/model/fav_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../data_sources/add_fav_remote_data_source.dart';
import 'fav_repo.dart';

class FavouriteRepoImpl extends FavouriteRepo {
  final GetFavouriteRemoteDataSource favouriteRemoteDataSource;
  final AddFavouriteRemoteDataSource addFavouriteRemoteDataSource;
  final RemoveFavRemoteDataSource removeFavRemoteDataSource;

  FavouriteRepoImpl(
    this.favouriteRemoteDataSource,
    this.addFavouriteRemoteDataSource,
    this.removeFavRemoteDataSource,
  );

  @override
  Future<Either<Failure, FavouriteModel>> getFavourite() async {
    try {
      final getFavourite = await favouriteRemoteDataSource.getFavourite();
      return Right(getFavourite);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, FavouriteModel>> addFavourite(int id) async {
    try {
      final addFavourite = await addFavouriteRemoteDataSource.addToFavourite(
        id,
      );
      return Right(addFavourite);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, FavouriteModel>> removeFavProduct(int id) async {
    try {
      final removeFavProduct = await removeFavRemoteDataSource.removeFavProduct(
        id,
      );
      return Right(removeFavProduct);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
