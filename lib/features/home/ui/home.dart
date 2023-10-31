import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/features/cart/ui/cart.dart';
import 'package:store_app/features/drawer/ui/myHeaderDrawer.dart';
import 'package:store_app/features/favorite/favorite.dart';
import 'package:store_app/features/home/bloc/home_bloc.dart';
import 'package:store_app/features/home/ui/ProductWidget.dart';
import 'package:store_app/features/home/ui/best_offers_page.dart';
import 'package:store_app/features/home/ui/categories.dart';
import 'package:store_app/models/productModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();
  
  @override
  void initState() {
   
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }


 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeLoadingState) {
        } else if (state is HomeLoadedSuccessState) {
          for (final product in state.products) {
            // Affichez les autres propriétés du produit ici
          }
        } else if (state is HomeProductCartButtonClickedEvent) {
          SnackBar(content: Text("Item added in Cart"));
        }
      },
      builder: (context, state) {
        return Scaffold(
         
          body: state is HomeLoadedSuccessState
              ? SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child:Category()
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        
                        BestOffers(),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(margin:EdgeInsets.all(5), child:const Text("Feature Products",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,),)),
                        GridView.builder(
                          clipBehavior: Clip.none,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8,
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) => ProductWidget(
                            onTap: () {
                              print(state.products[index].id);
                            },
                            homeBloc: homeBloc,
                            productModel: ProductModel(
                                category: state.products[index].category,
                                description: state.products[index].description,
                                id: state.products[index].id,
                                image: state.products[index].image,
                                price: state.products[index].price,
                                rating: state.products[index].rating,
                                title: state.products[index].title),
                          ),
                        ),
                      ],
                    ),
                  ),
              )
              : state is HomeLoadingState
                  ? Center(child: CircularProgressIndicator())
                  : state is HomeNavigateToCartPageActionState
                      ? CartPage()
                      : state is HomeNavigateToFavoritePageActionState
                          ? FavoritePage()
                          : Container(),
          
        );
      },
    );
  }

  Text title(
    HomeActionState state,
  ) {
    if (state is HomeLoadingState ||
        state is HomeErrorState ||
        state is HomeLoadedSuccessState) {
      return const Text('ShopApp');
    } else if (state is HomeNavigateToCartPageActionState) {
      return const Text('Cart');
    } else if (state is HomeNavigateToFavoritePageActionState) {
      return const Text('Favorite');
    } else {
      return const Text('');
    }
  }

  

 
}


