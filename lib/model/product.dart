
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {

  int? id;
  String? title;
  String? description;
  num? price;
  String? image;
  String? category;

  Product({this.id, this.title,this.description, this.price, this.image, this.category});

  // Manual Serialization
  // Serializable
  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "title": title,
  //     "description":description,
  //     "price":price,
  //     "image":image,
  //     "category":category
  //   };
  // }

  // Deserializable
  // factory Product.fromJson(Map<String,dynamic> json){
  //     return Product(
  //       id: json["id"],
  //       title: json["title"],
  //       description: json["description"],
  //       price: json["price"],
  //       image: json["image"],
  //       category: json["category"]
  //     );
  // }

  // AutoSerialization
  // Serialization
  Map<String,dynamic> toJson() => _$ProductToJson(this);

  // Deserialization
  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
}