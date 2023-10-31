import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/helper/data/itiems.dart';
import 'package:store_app/models/productModel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  int count =0;
 
  CartBloc() : super(CartInitialstate()) {
    on<CartInitial>(cartInitialEvent);
    on<CartProductRemoveButtonClickedEvent>(cartProductRemoveButtonClickedEvent);
    on<CartAddCountWidgetEvent>(cartAddCountWidgetEvent);
    on<CartMinsCountWidgetEvent>(cartMinsCountWidgetEvent);
  }
  
    
  
  FutureOr<void> cartAddCountWidgetEvent(CartAddCountWidgetEvent event, Emitter<CartState> emit) {
    emit(CartAddCountWidgetState(count++));
  }
  
  FutureOr<void> cartMinsCountWidgetEvent(CartMinsCountWidgetEvent event, Emitter<CartState> emit) {
    emit(CartMinCountWidgetState( count--));
  }
  }
  FutureOr<void> cartInitialEvent(
      CartEvent event, Emitter<CartState> emit) async {
    emit(CartLoadedSuccessState(products: cartItems));
  }

  FutureOr<void> cartProductRemoveButtonClickedEvent(CartProductRemoveButtonClickedEvent event, Emitter<CartState> emit) async{
      int i = 0;
    while (
        (i < cartItems.length && cartItems[i].id != event.clickedProduct.id)) {
      i++;
    }
     cartItems.removeAt(i);
    emit(CartLoadedSuccessState(products: cartItems));
  
  }

 

