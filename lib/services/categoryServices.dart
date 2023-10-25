

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/productModel.dart';


class CategoryService {
  Future<List<ProductModel>> getCategoryProducts({required String CategoryName}) async {
    
       // ignore: missing_required_param
       List<dynamic> body =await Api().get(url: 'https://fakestoreapi.com/products/category/$CategoryName',);
      List<ProductModel> products = [];
      for (int i = 0; i < body.length; i++) {
        products.add(ProductModel.fromJson(body[i]));
      }
      return products;
    
  }
}
