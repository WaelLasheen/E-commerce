import 'package:e_commerce/Model/rating.dart';

class productModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  productModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  productModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price']/1.0;
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
    'id' : this.id,
    'title' : this.title,
    'price' : this.price,
    'description' : this.description,
    'category' : this.category,
    'image' : this.image,
    'rating' : this.rating != null? this.rating!.toJson() : null,
    };
    return data;
  }
}
