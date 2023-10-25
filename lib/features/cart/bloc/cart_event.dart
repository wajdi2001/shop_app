part of 'cart_bloc.dart';

@immutable
 class CartEvent {}
 class CartInitial extends CartEvent {}
 class CartProductRemoveButtonClickedEvent extends CartEvent {
  final ProductModel clickedProduct;
   final int id;
   CartProductRemoveButtonClickedEvent({required this.id,required this.clickedProduct});
 }
 class CartAddCountWidgetEvent extends CartEvent{}
 class CartMinsCountWidgetEvent extends CartEvent{}
