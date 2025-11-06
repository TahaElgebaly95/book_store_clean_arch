part of 'add_and_remove_fav_cubit.dart';

 class AddOrRemoveFavState extends Equatable {
  const AddOrRemoveFavState();

  @override
  List<Object?> get props => [];
}

final class AddToFavInitialState extends AddOrRemoveFavState {}

final class AddToFavLoadingState extends AddOrRemoveFavState {}

final class AddToFavSuccessState extends AddOrRemoveFavState {
  final FavouriteModel favouriteModel;

  const AddToFavSuccessState(this.favouriteModel);
}

final class AddToFavErrorState extends AddOrRemoveFavState {
  final String error;

  const AddToFavErrorState(this.error);
}
//****************************************************
final class RemoveFavInitialState extends AddOrRemoveFavState {}

final class RemoveFavLoadingState extends AddOrRemoveFavState {}

final class RemoveFavSuccessState extends AddOrRemoveFavState {
  final FavouriteModel favouriteModel;

  const RemoveFavSuccessState(this.favouriteModel);
}

final class RemoveFavErrorState extends AddOrRemoveFavState {
  final String error;

  const RemoveFavErrorState(this.error);
}

