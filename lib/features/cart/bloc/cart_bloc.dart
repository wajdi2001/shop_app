import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/helper/data/itiems.dart';
import 'package:store_app/models/productModel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int count =5;
 
  CartBloc() : super(CartInitialstate()) {
    on<CartInitial>(cartInitialEvent);
    on<CartProductRemoveButtonClickedEvent>(cartProductRemoveButtonClickedEvent);
    on<CartAddCountWidgetEvent>(cartAddCountWidgetEvent);
    on<CartMinsCountWidgetEvent>(cartMinsCountWidgetEvent);
  }
  
    Map<int, int> productQuantities = {}; // Utilisez un Map pour associer les ID de produit à leurs quantités

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartAddCountWidgetEvent) {
      productQuantities[event.clickedProduct.id]=productQuantities[event.clickedProduct.id]!+1; // Incrémentez la quantité du produit
    } else if (event is CartMinsCountWidgetEvent) {
      if (productQuantities[event.clickedProduct.id]! > 0) {
        productQuantities[event.clickedProduct.id]=productQuantities[event.clickedProduct.id]!-1; // Décrémentez la quantité du produit
      }
    }
    // ...
  }
  
  FutureOr<void> cartAddCountWidgetEvent(CartAddCountWidgetEvent event, Emitter<CartState> emit) {
  productQuantities[event.clickedProduct.id] = (productQuantities[event.clickedProduct.id] ?? 0) + 1; // Increment the quantity of the product
  emit(CartLoadedSuccessState(products: cartItems, productQuantities: productQuantities));
}
  
  FutureOr<void> cartMinsCountWidgetEvent(CartMinsCountWidgetEvent event, Emitter<CartState> emit) {
  if (productQuantities[event.clickedProduct.id] != null && productQuantities[event.clickedProduct.id]! > 0) {
     productQuantities[event.clickedProduct.id]=productQuantities[event.clickedProduct.id]!-1; // Decrement the quantity of the product
    emit(CartLoadedSuccessState(products: cartItems, productQuantities: productQuantities));
  }
}
  }
  FutureOr<void> cartInitialEvent(
      CartEvent event, Emitter<CartState> emit) async {
        
    emit(CartLoadedSuccessState(products: cartItems,productQuantities: {}));
  }

  FutureOr<void> cartProductRemoveButtonClickedEvent(CartProductRemoveButtonClickedEvent event, Emitter<CartState> emit) async{
      int i = 0;
    while (
        (i < cartItems.length && cartItems[i].id != event.clickedProduct.id)) {
      i++;
    }
     cartItems.removeAt(i);
     
    emit(CartLoadedSuccessState(products: cartItems, productQuantities: {}));
  
  }

 

