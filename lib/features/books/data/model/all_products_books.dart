import 'package:json_annotation/json_annotation.dart';

import '../../../home/domain/entities/product_entity.dart';

part 'all_products_books.g.dart';

@JsonSerializable()
class AllProductsBooksModel {
  final ProductsData data;
  final String message;
  final List<dynamic> error;
  final int status;

  AllProductsBooksModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory AllProductsBooksModel.fromJson(Map<String, dynamic> json) => _$AllProductsBooksModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllProductsBooksModelToJson(this);
}

// -----------------------------------------------------------------------------

@JsonSerializable()
class ProductsData {
  final List<ProductModel> products;
  final Meta meta;
  final Links links;

  ProductsData({
    required this.products,
    required this.meta,
    required this.links,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json) => _$ProductsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsDataToJson(this);
}

// -----------------------------------------------------------------------------

@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String description;
  @JsonKey(fromJson: _priceFromString, toJson: _priceToString)
  final String price;
  final int discount;
  @JsonKey(name: 'price_after_discount')
  final double priceAfterDiscount;
  final int stock;
  @JsonKey(name: 'best_seller')
  final int bestSeller;
  final String image;
  final String category;

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

// Custom (De)Serializer functions for price - Optional, but good practice
String _priceToString(String price) => price;
String _priceFromString(String price) => price;

// -----------------------------------------------------------------------------

@JsonSerializable()
class Meta {
  final int total;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'last_page')
  final int lastPage;

  Meta({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

// -----------------------------------------------------------------------------

@JsonSerializable()
class Links {
  final String first;
  final String last;
  final String? prev; // يمكن أن تكون null
  final String? next; // يمكن أن تكون null

  Links({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
extension ProductModelExtension on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      name: name ?? '',
      description: description ?? '',
      price: price ?? '0',
      discount: discount ?? 0,
      priceAfterDiscount: priceAfterDiscount ?? 0.0,
      stock: stock ?? 0,
      isBestSeller: (bestSeller ?? 0) == 1,
      imageUrl: image ?? '',
      category: category ?? '',
    );
  }
}