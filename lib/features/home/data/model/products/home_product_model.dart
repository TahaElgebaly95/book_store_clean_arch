import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/product_entity.dart';

part 'home_product_model.g.dart';

@JsonSerializable()
class HomeProductModel {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'price')
  final dynamic price;  // Changed from String? to dynamic

  @JsonKey(name: 'discount')
  final int? discount;

  @JsonKey(name: 'price_after_discount')
  final dynamic priceAfterDiscount;


  @JsonKey(name: 'stock')
  final int? stock;

  @JsonKey(name: 'best_seller')
  final int? bestSeller;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'category')
  final String? category;

  HomeProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProductModelFromJson(json);

  ProductEntity toEntity() {
    String priceStr = '0';
    if (price != null) {
      priceStr = price.toString();
    }

    double priceAfter = 0.0;
    if (priceAfterDiscount != null) {
      if (priceAfterDiscount is int) {
        priceAfter = priceAfterDiscount?.toDouble() ?? 0.0;
      } else if (priceAfterDiscount is double) {
        priceAfter = priceAfterDiscount;
      } else if (priceAfterDiscount is String) {
        priceAfter = double.tryParse(priceAfterDiscount) ?? 0.0;
      }
    }

    return ProductEntity(
      id: id ?? 0,
      name: name ?? 'Unknown Product',
      description: description ?? 'No description available',
      price: priceStr,
      discount: discount ?? 0,
      priceAfterDiscount: priceAfter,
      stock: stock ?? 0,
      isBestSeller: (bestSeller ?? 0) == 1,
      imageUrl: image ?? '',
      category: category ?? 'Uncategorized',
    );
  }
}