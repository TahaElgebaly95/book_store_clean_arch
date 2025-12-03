// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProductModel _$HomeProductModelFromJson(Map<String, dynamic> json) =>
    HomeProductModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'],
      discount: (json['discount'] as num?)?.toInt(),
      priceAfterDiscount: json['price_after_discount'],
      stock: (json['stock'] as num?)?.toInt(),
      bestSeller: (json['best_seller'] as num?)?.toInt(),
      image: json['image'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$HomeProductModelToJson(HomeProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'price_after_discount': instance.priceAfterDiscount,
      'stock': instance.stock,
      'best_seller': instance.bestSeller,
      'image': instance.image,
      'category': instance.category,
    };
