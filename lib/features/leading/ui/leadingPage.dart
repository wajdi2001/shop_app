import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/cart/ui/cart.dart';
import 'package:store_app/features/favorite/favorite.dart';
import 'package:store_app/features/home/ui/home.dart';
import 'package:store_app/features/leading/bloc/leading_bloc.dart';
import 'package:store_app/helper/color.dart';

class LeadingPage extends StatelessWidget {
  LeadingBloc leading = LeadingBloc();

  List<Widget> pages = [
    HomePage(),
    FavoritePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: leading,
        listener: ((context, state) {}),
        builder: ((context, state) {
          return Scaffold(
            body: state is LeadingInitial ? pages[state.index] : pages[1],
            bottomNavigationBar: CurvedNavigationBar(
              color: Colors.blueGrey,
              height:60,
              index: state is LeadingInitial ? state.index : 1,
              animationCurve: Curves.easeInOutCirc,
              backgroundColor: Colors.transparent,
              items: <Widget>[
                Icon(Icons.home, size: 30,color: Colors.white,),
                Icon(Icons.favorite, size: 30,color: Colors.white,),
                Icon(Icons.shopping_cart, size: 30,color: Colors.white,),
              ],
              onTap: (index) {
                if (index == 0) {
                  leading.add(LeadingSwitchPage(index: 0));
                } else if (index == 1) {
                  leading.add(LeadingSwitchPage(index: 1));
                } else if (index == 2) {
                  leading.add(LeadingSwitchPage(index: 2));
                }

                //Handle button tap
              },
            ),
          );
        }));
  }
}
