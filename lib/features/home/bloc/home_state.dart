part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {
  final String  errorMessage;
  HomeErrorState(this.errorMessage  );
  
}

class HomeNavigateToCartPageActionState extends HomeActionState{}
class HomeNavigateToFavoritePageActionState extends HomeActionState{}
class HomeNavigateToSearchPageActionState extends HomeActionState{}
class HomeNavigateToProfilePageActionState extends HomeActionState{}