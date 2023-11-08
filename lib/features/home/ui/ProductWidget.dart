import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:store_app/features/home/bloc/home_bloc.dart';
import 'package:store_app/helper/data/itiems.dart';
import 'package:store_app/models/productModel.dart';


// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;
  VoidCallback onTap;

  ProductWidget({
    super.key,
    required this.productModel,
    required this.homeBloc,
    required this.onTap,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool added = false;
  bool addedfav =false;

  bool isLiked =false;

  Color favorite = Colors.grey;

  Color cart = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10, // Adjust the blur radius for the base shadow
                    offset: Offset(0, 0), // Offset for the base shadow
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 20, // Adjust the blur radius for the second shadow
                    offset: Offset(0, 10), // Offset for the second shadow (vertical)
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 20, // Adjust the blur radius for the third shadow
                    offset: Offset(10, 0), // Offset for the third shadow (horizontal)
                  ),
                ],
              ),
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
                         child: IconButton(
                             onPressed: () {
                               if (addedfav== false) {

                                 widget.homeBloc.add(
                                     HomeProductWishlistButtonClickedEvent(
                                         id: widget.productModel.id,
                                         isAdded: addedfav,
                                         clickedProduct:
                                         widget.productModel));

                                 setState(() {
                                   addedfav=addedfav! ;
                                 });
                                 print(cartItems.length);
                               } else {


                                 widget.homeBloc.add(
                                     HomeProductWishlistButtonClickedEvent(
                                         id: widget.productModel.id,
                                         isAdded: addedfav,
                                         clickedProduct:
                                         widget.productModel));

                                 print(cartItems.length);
                                 setState(() {
                                   addedfav=addedfav;
                                 });

                               }
                             },
                             icon: FaIcon(
                               textDirection: TextDirection.rtl,
                               FontAwesomeIcons.solidHeart,
                               color: addedfav == false
                                   ? Colors.grey
                                   : Colors.red,
                               size: 20,
                             ))),
                        Spacer(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                maxLines: 1,
                                widget.productModel.title,
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
                                    '\$${widget.productModel.price}',
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
                                            if (widget.homeBloc.added == false) {

                                              widget.homeBloc.add(
                                                  HomeProductCartButtonClickedEvent(
                                                      id: widget.productModel.id,
                                                      cart: widget.homeBloc.cart,
                                                      isAdded: widget.homeBloc.added,
                                                      clickedProduct:
                                                          widget.productModel));

                                                setState(() {
                                                  added=widget.homeBloc.added ;
                                                });
                                              print(cartItems.length);
                                            } else {


                                              widget.homeBloc.add(
                                                  HomeProductCartButtonClickedEvent(
                                                      id: widget.productModel.id,
                                                      cart: widget.homeBloc.cart,
                                                      isAdded: widget.homeBloc.added,
                                                      clickedProduct:
                                                          widget.productModel));

                                              print(cartItems.length);
                                              setState(() {
                                                added=widget.homeBloc.added;
                                              });

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
                image: NetworkImage(widget.productModel.image),
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