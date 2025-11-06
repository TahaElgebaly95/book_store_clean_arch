part of 'get_favourite_cubit.dart';

class GetFavouriteState extends Equatable {
  const GetFavouriteState();

  @override
  List<Object?> get props => [];
}

final class GetFavouriteInitialState extends GetFavouriteState {}

final class GetFavouriteLoadingState extends GetFavouriteState {}

final class GetFavouriteSuccessState extends GetFavouriteState {
  final FavouriteModel favouriteModel;


  const GetFavouriteSuccessState(this.favouriteModel);
}

final class GetFavouriteErrorState extends GetFavouriteState {
  final String error;

  const GetFavouriteErrorState(this.error);
}
