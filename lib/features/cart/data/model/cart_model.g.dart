// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
  data:
      json['data'] == null
          ? null
          : CartData.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'status': instance.status,
};

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
  id: (json['id'] as num?)?.toInt(),
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
  total: json['total'] as String?,
  cartItems:
      (json['cart_items'] as List<dynamic>?)
          ?.map((e) => CartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'total': instance.total,
  'cart_items': instance.cartItems,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  userId: (json['user_id'] as num?)?.toInt(),
  userName: json['user_name'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'user_id': instance.userId,
  'user_name': instance.userName,
};

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
  itemId: (json['item_id'] as num?)?.toInt(),
  itemProductId: (json['item_product_id'] as num?)?.toInt(),
  itemProductName: json['item_product_name'] as String?,
  itemProductImage: json['item_product_image'] as String?,
  itemProductPrice: json['item_product_price'] as String?,
  itemProductDiscount: (json['item_product_discount'] as num?)?.toInt(),
  itemProductPriceAfterDiscount:
      (json['item_product_price_after_discount'] as num?)?.toDouble(),
  itemProductStock: (json['item_product_stock'] as num?)?.toInt(),
  itemQuantity: (json['item_quantity'] as num?)?.toInt(),
  itemTotal: (json['item_total'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
  'item_id': instance.itemId,
  'item_product_id': instance.itemProductId,
  'item_product_name': instance.itemProductName,
  'item_product_image': instance.itemProductImage,
  'item_product_price': instance.itemProductPrice,
  'item_product_discount': instance.itemProductDiscount,
  'item_product_price_after_discount': instance.itemProductPriceAfterDiscount,
  'item_product_stock': instance.itemProductStock,
  'item_quantity': instance.itemQuantity,
  'item_total': instance.itemTotal,
};
