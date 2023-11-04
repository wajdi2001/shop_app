import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Customs/custom_like_widget.dart';
import 'package:store_app/features/home/bloc/home_bloc.dart';
import 'package:store_app/helper/data/itiems.dart';
import 'package:store_app/models/productModel.dart';


// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;
  VoidCallback onTap;
  bool added = false;
  bool isLiked =false;
  Color favorite = Colors.grey;
  Color cart = Colors.grey;
  //added to cart or not
  ProductWidget({
    super.key,
    required this.productModel,
    required this.homeBloc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 40,
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5)
                  ]),
              margin: EdgeInsets.only(left: 5),
              child: Card(
                shadowColor: Colors.black,
                elevation: 2,
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(),
                    margin: EdgeInsets.only(left: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                       Padding(
                         padding: const EdgeInsets.only( left: 100.0),
                         child: CustomLikeButton(
                          isLiked: isLiked,
                          onPressed: () {
                                if (added == false) {
                                  
                                  homeBloc.add(
                                      HomeProductWishlistButtonClickedEvent(
                                          id: productModel.id,
                                          
                                          isAdded: added,
                                          clickedProduct: productModel));
                                  added = !added;
                                  isLiked=!isLiked;
                                } else {
                                  
                                  homeBloc.add(
                                      HomeProductWishlistButtonClickedEvent(
                                          id: productModel.id,
                                          
                                          isAdded: added,
                                          clickedProduct: productModel));
                                  added = !added;
                                  
                                }
                                ;
                              },),
                       ),
                        Spacer(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                maxLines: 1,
                                productModel.title,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    overflow: TextOverflow.visible),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${productModel.price}',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.visible),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            if (homeBloc.added == false) {
                                              
                                              homeBloc.add(
                                                  HomeProductCartButtonClickedEvent(
                                                      id: productModel.id,
                                                      cart: homeBloc.cart,
                                                      isAdded: homeBloc.added,
                                                      clickedProduct:
                                                          productModel));
                                              
                                              
                                              print(cartItems.length);
                                            } else {
                                              

                                              homeBloc.add(
                                                  HomeProductCartButtonClickedEvent(
                                                      id: productModel.id,
                                                      cart: homeBloc.cart,
                                                      isAdded: homeBloc.added,
                                                      clickedProduct:
                                                          productModel));
                                              
                                              print(cartItems.length);
                                              
                                              
                                            }
                                          },
                                          icon: FaIcon(
                                            textDirection: TextDirection.rtl,
                                            FontAwesomeIcons.shoppingCart,
                                            color: added == false
                                                ? Colors.grey
                                                : Colors.green,
                                            size: 20,
                                          )),
                                    ],
                                  ),
                                ],
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Image(
                image: NetworkImage(productModel.image),
                height: 70,
                width: 80,
              ),
              right: 65,
              bottom: 85,
              top: 0,
            )
          ],
        ),
      ),
    );
  }
}
