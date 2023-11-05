import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/features/cart/bloc/cart_bloc.dart';
import 'package:store_app/models/productModel.dart';



class CartWidget extends StatefulWidget {
  final CartBloc cartBloc;
  
  final ProductModel productModel ;

  CartWidget({super.key, required this.productModel, required this.cartBloc});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  
  int count = 1;

  @override
  Widget build(BuildContext context) {
    int productQuantity = widget.cartBloc.productQuantities[widget.productModel.id] ?? 0;
    return BlocConsumer(
      bloc: widget.cartBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Row(children: [
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Image(
                fit: BoxFit.fitHeight,
                image: NetworkImage(widget.productModel.image),
                height: 60,
                width: 60,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(truncateText(widget.productModel.title, 20),
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  Text('\$${widget.productModel.price}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {

                              productQuantity > 0 ? widget.cartBloc.add(CartMinsCountWidgetEvent(count: productQuantity,clickedProduct: widget.productModel)) : print("count 0");
                             
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.minus,
                              size: 16,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${productQuantity}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {
                              widget.cartBloc.add(CartAddCountWidgetEvent(count: productQuantity,clickedProduct: widget.productModel));
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.plus,
                              size: 16,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: Colors.white,
                ),
                width: 40,
                height: 40,
                child: IconButton(
                    onPressed: () {
                      widget.cartBloc.add(CartProductRemoveButtonClickedEvent(
                          id: widget.productModel.id,
                          clickedProduct: widget.productModel));
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      size: 25,
                    )))
          ]),
        );
      },
    );
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength) +
        '...'; // Add an ellipsis (...) to indicate truncation
  }
}
