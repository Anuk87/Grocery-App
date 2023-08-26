part of 'objects.dart';

@JsonSerializable()
class ProductModel{
  final String productId;
  final String productName;
  final String desc;
  final double price;
  final String image;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.desc,
    required this.price,
    required this.image
  });

  //-----bind json data to user model
  factory ProductModel.fromJson(Map<String, dynamic> json) =>_$ProductModelFromJson(json);

  // ------ convert user model into a json object
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}