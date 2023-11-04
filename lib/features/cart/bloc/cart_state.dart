part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialstate extends CartState {}

abstract class CartActionState extends CartState {}

final class ClassInitial extends CartState {}

class ClassLoadingState extends CartState {}

class CartLoadedSuccessState extends CartState {
  final List<ProductModel> products;
  final Map<int, int> productQuantities;

  CartLoadedSuccessState({required this.products, required this.productQuantities});

  @override
  List<Object> get props => [products, productQuantities];
}


class CartErrorState extends CartState {
  final String errorMessage;
  CartErrorState(this.errorMessage);
}
class CartAddCountWidgetState extends CartState
{
  final  int count;
  CartAddCountWidgetState(this.count);
}
class CartMinCountWidgetState extends CartState
{
  final  int count;
  CartMinCountWidgetState(this.count);
}