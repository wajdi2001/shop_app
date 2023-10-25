import 'package:flutter/material.dart';

import '../../../models/productModel.dart';
import '../bloc/home_bloc.dart';

class BestOffersWidget extends StatelessWidget {
   final ProductModel productModel;
  final HomeBloc homeBloc;
  VoidCallback onTap;
  BestOffersWidget({super.key,required this.productModel,
    required this.homeBloc,
    required this.onTap,}
    );
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      height: 180,
      margin: EdgeInsets.only(top: 8, left: 8),
      width: double.infinity,
      
    );
  }
}
