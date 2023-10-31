import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/Login/ui/login_page.dart';
import 'package:store_app/features/cart/ui/cart.dart';
import 'package:store_app/features/drawer/ui/myHeaderDrawer.dart';
import 'package:store_app/features/favorite/favorite.dart';
import 'package:store_app/features/home/ui/home.dart';
import 'package:store_app/features/leading/bloc/leading_bloc.dart';

// ignore: must_be_immutable
class LeadingPage extends StatelessWidget {
  LeadingBloc leading = LeadingBloc(open: false);

  List<Widget> pages = [
    HomePage(),
    FavoritePage(),
    CartPage(),
  ];

  LeadingPage({super.key});
  var currentPage = DrawerSection.Category;
  var currentTitle = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: leading,
        listener: ((context, state) {}),
        builder: ((context, state) {
          return Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(Title(currentTitle),
                    style: const TextStyle(color: Colors.black)),
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
            body: state is LeadingInitial ? pages[state.index] : pages[1],
            bottomNavigationBar: CurvedNavigationBar(
              animationDuration: const Duration(milliseconds: 700),
              color: Colors.blueGrey,
              height: 60,
              index: state is LeadingInitial ? state.index : 1,
              animationCurve: Curves.easeInOutCirc,
              backgroundColor: Colors.white,
              items: const <Widget>[
                Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Colors.white,
                ),
              ],
              onTap: (index) {
                currentTitle = index;
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
                       const  SizedBox(
                        height: 270,
                      ),
                      ItemDrawerList(

                          id: 4,
                          title: 'Profile',
                          icon: Icons.logout,
                          isSelected: currentPage == DrawerSection.LogOut
                              ? true
                              : false,
                          chevron: false),
                    const  SizedBox(
                        height: 5,
                      ),
                      ItemDrawerList(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));},
                          id: 5,
                          title: 'Log Out',
                          icon: Icons.logout,
                          isSelected: currentPage == DrawerSection.LogOut
                              ? true
                              : false,
                          chevron: false),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }

  Widget myDrawerList() {
    return Container(
      color: Colors.grey.shade50,
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        ItemDrawerList(
            id: 1,
            title: 'Category',
            icon: Icons.category_rounded,
            isSelected: currentPage == DrawerSection.Category ? true : false,
            chevron: true,
            onTap: () {
              leading.add(LeadingOpenCategory(open: leading.open,));
            }),
        
             leading.open==true ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ItemDrawerList(
                      id: 1,
                      title: 'Informatique',
                      icon: Icons.category_rounded,
                      isSelected:
                          currentPage == DrawerSection.Category ? true : false,
                      chevron: false),
                  ItemDrawerList(
                      id: 1,
                      title: 'Accessories',
                      icon: Icons.category_rounded,
                      isSelected:
                          currentPage == DrawerSection.Category ? true : false,
                      chevron: false),
                  ItemDrawerList(
                      id: 1,
                      title: 'Men',
                      icon: Icons.category_rounded,
                      isSelected:
                          currentPage == DrawerSection.Category ? true : false,
                      chevron: false),
                  ItemDrawerList(
                      id: 1,
                      title: 'Beauty',
                      icon: Icons.category_rounded,
                      isSelected:
                          currentPage == DrawerSection.Category ? true : false,
                      chevron: false),
                ],
              )
            : const SizedBox(),
        const SizedBox(
          height: 5,
        ),
        ItemDrawerList(
            id: 2,
            title: 'Best Offers',
            icon: Icons.verified_outlined,
            isSelected: currentPage == DrawerSection.Bestoffrt ? true : false,
            chevron: false),
        const SizedBox(
          height: 5,
        ),
        ItemDrawerList(
            id: 3,
            title: 'Sell with US',
            icon: Icons.storefront_outlined,
            isSelected: currentPage == DrawerSection.sellWithUs ? true : false,
            chevron: false),
      ]),
    );
  }

  Widget ItemDrawerList(
      {required int id,
      required String title,
      required IconData icon,
      required bool isSelected,
      required bool chevron,
      VoidCallback? onTap}) {
    return Material(
      child: InkWell(
        onTap: onTap,
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
                flex: 2,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              chevron == true
                  ? const Expanded(child: Icon(Icons.arrow_drop_down_rounded))
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  String Title(currentTitle) {
    if (currentTitle == 0)
      return "Shop App";
    else if (currentTitle == 1)
      return "Favorite";
    else
      return "Cart";
  }
}

enum DrawerSection {
  Category,
  Bestoffrt,
  sellWithUs,
  LogOut,
}
