
// ignore_for_file: missing_required_param

import 'package:store_app/helper/api.dart';

class GetAllCategory {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> body =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return body;
  }
}
