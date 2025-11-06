// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_products_books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllProductsBooksModel _$AllProductsBooksModelFromJson(
  Map<String, dynamic> json,
) => AllProductsBooksModel(
  data: ProductsData.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String,
  error: json['error'] as List<dynamic>,
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$AllProductsBooksModelToJson(
  AllProductsBooksModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
  'status': instance.status,
};

ProductsData _$ProductsDataFromJson(Map<String, dynamic> json) => ProductsData(
  products:
      (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
  links: Links.fromJson(json['links'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductsDataToJson(ProductsData instance) =>
    <String, dynamic>{
      'products': instance.products,
      'meta': instance.meta,
      'links': instance.links,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  price: _priceFromString(json['price'] as String),
  discount: (json['discount'] as num).toInt(),
  priceAfterDiscount: (json['price_after_discount'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  bestSeller: (json['best_seller'] as num).toInt(),
  image: json['image'] as String,
  category: json['category'] as String,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': _priceToString(instance.price),
      'discount': instance.discount,
      'price_after_discount': instance.priceAfterDiscount,
      'stock': instance.stock,
      'best_seller': instance.bestSeller,
      'image': instance.image,
      'category': instance.category,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  total: (json['total'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  currentPage: (json['current_page'] as num).toInt(),
  lastPage: (json['last_page'] as num).toInt(),
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'total': instance.total,
  'per_page': instance.perPage,
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
};

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
  first: json['first'] as String,
  last: json['last'] as String,
  prev: json['prev'] as String?,
  next: json['next'] as String?,
);

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
  'first': instance.first,
  'last': instance.last,
  'prev': instance.prev,
  'next': instance.next,
};
