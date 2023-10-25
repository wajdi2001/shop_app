part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialstate extends CartState {}

abstract class CartActionState extends CartState {}

final class ClassInitial extends CartState {}

class ClassLoadingState extends CartState {}

class CartLoadedSuccessState extends CartState {
  final List<ProductModel> products;
  CartLoadedSuccessState({
    required this.products,
  });
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