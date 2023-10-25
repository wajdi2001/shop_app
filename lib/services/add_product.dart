
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/productModel.dart';

class AddProduct {
  Future<ProductModel> addProduct  ({
    required String title,
    required String price,
    required String decription,
    required String image,
    required String category,
  }) async {
    // ignore: missing_required_param
    Map<String,dynamic> data = await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': decription,
      'image': image,
      'category': category
    });
    return ProductModel.fromMap(data);
  }
}
