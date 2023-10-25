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


  var currentPage = DrawerSection.Category;

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
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title:
                  const Text('ShopApp', style: TextStyle(color: Colors.black)),
              centerTitle: true,
              leading: Builder(builder: (context) {
                return IconButton(
                  key: GlobalKey(),
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              })),
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
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    MyHeaderDrawer(),
                    SizedBox(
                      height: 10,
                    ),
                    myDrawerList(),
                  ],
                ),
              ),
            ),
          ),
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

  Widget myDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        ItemDrawerList(1, 'Category', Icons.category_rounded,
            currentPage == DrawerSection.Category ? true : false),
        SizedBox(
          height: 5,
        ),
        ItemDrawerList(1, 'Best Offers', Icons.verified_outlined,
            currentPage == DrawerSection.Category ? true : false),
        SizedBox(
          height: 5,
        ),
        ItemDrawerList(1, 'Sell with US', Icons.storefront_outlined,
            currentPage == DrawerSection.Category ? true : false),
      ]),
    );
  }

  Widget ItemDrawerList(int id, String title, IconData icon, bool isSelected) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                icon,
                size: 22,
              )),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                flex: 3,
              ),
              Expanded(child: Icon(Icons.chevron_right_sharp)),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSection {
  Category,
  Bestoffrt,
  sellWithUs,
}
/*CurvedNavigationBar(
            animationCurve: Curves.easeInOutCirc,
            backgroundColor: CustomColors.PrimaryColor,
            items: <Widget>[
              Icon(Icons.favorite, size: 30),
              Icon(Icons.home, size: 30),
              Icon(Icons.shopping_cart, size: 30),
            ],
            onTap: (index) {
              if (index == 0) {
                homeBloc.add(HomeNavigateFavoriteEvent());
              } else if (index == 2) {
                homeBloc.add(HomeNavigateCartEvent());
              } else if (index == 1) {
                homeBloc.add(HomeInitialEvent());
              }
              //Handle button tap
            },
          ), */