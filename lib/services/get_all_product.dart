import 'package:store_app/helper/api.dart';
import 'package:store_app/models/productModel.dart';

class GetAllProduct {
  GetAllProduct() {
    // constructor body
  }

  Future<List<ProductModel>> getAllProducts() async {
    // ignore: missing_required_param
    List<dynamic> body =
        await Api().get(url: 'https://fakestoreapi.com/products');
    Future.delayed(Duration(seconds: 3));
    //create a empty list of products
    List<ProductModel> products = [];
    //locate the products in the list
    for (int i = 0; i < body.length; i++) {
      products.add(ProductModel.fromMap(body[i]));
    }
    return products;
  }
}
