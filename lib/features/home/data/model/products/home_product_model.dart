// ========== 1. home_product_model.dart (NEW) ==========
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/product_entity.dart';

part 'home_product_model.g.dart';

@JsonSerializable()
class HomeProductModel {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'price')
  final String price;
  @JsonKey(name: 'discount')
  final int discount;
  @JsonKey(name: 'price_after_discount')
  final double priceAfterDiscount;
  @JsonKey(name: 'stock')
  final int stock;
  @JsonKey(name: 'best_seller')
  final int bestSeller;
  @JsonKey(name: 'image')
  final String image;
  @JsonKey(name: 'category')
  final String category;

  HomeProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.stock,
    required this.bestSeller,
    required this.image,
    required this.category,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProductModelFromJson(json);

  ProductEntity toEntity() => ProductEntity(
    id: id,
    name: name,
    description: description,
    price: price,
    discount: discount,
    priceAfterDiscount: priceAfterDiscount,
    stock: stock,
    isBestSeller: bestSeller == 1,
    imageUrl: image,
    category: category,
  );
}