part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;
  final bool isAdded;
 
  final int id;

  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
    required this.isAdded,
    required this.id,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;
  final bool isAdded;
  Color cart ;
   final int id;
  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
    required this.isAdded,
    required this.cart,
  required this.id,
  });
}

class HomeNavigateCartEvent extends HomeEvent {}

class HomeNavigateProfileEvent extends HomeEvent {}

class HomeNavigateFavoriteEvent extends HomeEvent {}

class HomeNavigateSearchEvent extends HomeEvent {}
