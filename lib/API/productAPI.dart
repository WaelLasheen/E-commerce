import 'dart:convert';

import 'package:e_commerce/Model/productModel.dart';
import 'package:http/http.dart' as http;

class ProductAPI{
  Future<List<productModel>>featchData() async{
    String URL = "https://fakestoreapi.com/products";
    final respond = await http.get(Uri.parse(URL));
    if(respond.statusCode ==200){
      final data = jsonDecode(respond.body);
      List<productModel> products = [];
          for(Map<String,dynamic> product in data){
            products.add(productModel.fromJson(product));
          }
      return products;
    }
    throw("Error in API : ${respond.statusCode}");
  }
}