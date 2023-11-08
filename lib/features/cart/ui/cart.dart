import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/cart/bloc/cart_bloc.dart';
import 'package:store_app/features/cart/ui/cartWidget.dart';
import 'package:store_app/helper/data/itiems.dart';
import 'package:store_app/models/productModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    cartBloc.add(CartInitial());
    super.initState();
  }

  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: cartBloc,
        listener: ((context, state)
         
         {}),
        builder: (context, state) {
          return Scaffold(
              
              body: (state is CartLoadedSuccessState)&& cartItems.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                                separatorBuilder: (context, index) => const Divider(
                                      color: Colors.grey,
                                    ),
                                itemBuilder: (context, index) {
                                  
                                  return CartWidget(
                                    
                                    
                                    productModel: ProductModel(
                                      
                                        category:
                                            state.products[index].category,
                                        description:
                                            state.products[index].description,
                                        id: state.products[index].id,
                                        image: state.products[index].image,
                                        price: state.products[index].price,
                                        rating: state.products[index].rating,
                                        title: state.products[index].title),
                                    cartBloc: cartBloc,
                                  );
                                },
                                itemCount: state.products.length),
                          ),
                        ),
                        Container(

                          margin:const  EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(

                              
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(22)),
                          height: 60,
                          width: 320,
                          
                          alignment: Alignment.center,

                          child: GestureDetector(
                            

                            child:const  Text(
                              "CheckOut",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                    alignment: Alignment.center,
                    child: const Text("Your Cart is Empty",style: TextStyle(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.bold),),
                  ));
        });
  }
}
