import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mad/model/product.dart';

class ProductService {

  static final ProductService instance = ProductService._init();

  ProductService._init();

  Future<List<Product>> getProducts() async{
    String apiUrl = "https://fakestoreapi.com/products";
    final header = {
      "Content-Type":"application/json"
    };
    final response = await http.get(Uri.parse(apiUrl), headers: header);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body) as List<dynamic>;
      List<Product> products = data.map((json) => Product.fromJson(json)).toList();
      print("Data : $products");
      return products;
    }else{
      print(response.statusCode);
      throw("Internal Server Error");
    }
  }
}