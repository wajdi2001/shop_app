import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/data/itiems.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/services/get_all_product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Color cart=Colors.grey;
  bool added = false;
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeNavigateFavoriteEvent>(homeNavigateFavoriteEvent);
    on<HomeNavigateCartEvent>(homeNavigateCartEvent);
  }

  Future<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      emit(HomeLoadedSuccessState(
          products: await GetAllProduct().getAllProducts()));
    } catch (e) {
      // Gérez les erreurs ici
      emit(HomeErrorState("Une erreur s'est produite"));
    }
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    if (event.isAdded == false) {
      favoriteItems.add(event.clickedProduct);
      print('item added');
    } else {
      favoriteItems.remove(event.clickedProduct);

      print('item removed');
    }
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) async {
    int i = 0;
    while (
        (i < cartItems.length && cartItems[i].id != event.clickedProduct.id)) {
      print(i);
      i++;
    }
    if (i >= cartItems.length) {
      cartItems.add(event.clickedProduct);
      print('item added with id :${event.clickedProduct.id}');
      cart=Colors.black;
      added =true;
    } else {
      print('item exist with id :${event.clickedProduct.id}');
      cartItems.removeAt(i);
      print('item removed ');
      cart=Colors.white;
      added =false;
    }
    
  }

  FutureOr<void> homeNavigateFavoriteEvent(
      HomeNavigateFavoriteEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToFavoritePageActionState());
  }

  FutureOr<void> homeNavigateCartEvent(
      HomeNavigateCartEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }
}