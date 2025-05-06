part of 'add_favourite_cubit.dart';

@immutable
sealed class AddFavouriteState {}

final class AddFavouriteInitial extends AddFavouriteState {}
final class AddFavouriteSuccess extends AddFavouriteState {
  final Map<String, dynamic> response;
  AddFavouriteSuccess({required this.response});
}

final class AddFavouriteFailure extends AddFavouriteState {
  final Map<String, dynamic> error;

  AddFavouriteFailure({required this.error});
}

