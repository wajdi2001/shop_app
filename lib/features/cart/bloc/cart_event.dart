part of 'cart_bloc.dart';

@immutable
 class CartEvent {}
 class CartInitial extends CartEvent {}
 class CartProductRemoveButtonClickedEvent extends CartEvent {
  final ProductModel clickedProduct;
   final int id;
   CartProductRemoveButtonClickedEvent({required this.id,required this.clickedProduct});
 }
 // ignore: must_be_immutable
 class CartAddCountWidgetEvent extends CartEvent
 {
  final ProductModel clickedProduct;
  int count =0;
  CartAddCountWidgetEvent({required this.clickedProduct,required this.count});
 }
 // ignore: must_be_immutable
 class CartMinsCountWidgetEvent extends CartEvent
 {
  final ProductModel clickedProduct;
  int count =0;
  CartMinsCountWidgetEvent({required this.clickedProduct,required this.count});
 }
