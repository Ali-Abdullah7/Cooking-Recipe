import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cooking_recipe/model/product.dart';

class HomeViewModel extends GetxController {
  // RxList<Product> list = <Product>[].obs;
  // Product? product;
  List<Product> list = <Product>[];
  @override
  void onInit() {
    super.onInit();
    getApiData();
  }

  Uri url = Uri.parse(
      'https://api.edamam.com/search?q=chicken&app_id=1bd5ac26&app_key=9cdd5f2c583a0ea0f1ad4a95773bc8f3&from=0&to=100&calories=591-722&health=alcohol-free');
  getApiData() async {
    var response = await http.get(url);
    
      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);
        json['hits'].forEach((e) {
          Product product = Product(
              url: e['recipe']['uri'],
              image: e['recipe']['image'],
              source: e['recipe']['source'],
              label: e['recipe']['label']);
          return list.add(product);
        });
      } else {
        return Get.snackbar('statusCode not equals to 200', 'not equals 200');
      }
  }
}
