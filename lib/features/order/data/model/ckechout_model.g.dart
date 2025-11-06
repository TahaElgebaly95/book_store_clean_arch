// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ckechout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutModel _$CheckOutModelFromJson(Map<String, dynamic> json) =>
    CheckOutModel(
      data: CheckOutData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      error: json['error'] as List<dynamic>,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$CheckOutModelToJson(CheckOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

CheckOutData _$CheckOutDataFromJson(Map<String, dynamic> json) => CheckOutData(
  id: (json['id'] as num).toInt(),
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
  total: json['total'] as String,
  cartItems:
      (json['cart_items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CheckOutDataToJson(CheckOutData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'total': instance.total,
      'cart_items': instance.cartItems,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  json['email'] as String?,
  userId: (json['user_id'] as num).toInt(),
  userName: json['user_name'] as String,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'user_id': instance.userId,
  'user_name': instance.userName,
  'address': instance.address,
  'phone': instance.phone,
  'email': instance.email,
};

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
  itemId: (json['item_id'] as num).toInt(),
  itemProductId: (json['item_product_id'] as num).toInt(),
  itemProductName: json['item_product_name'] as String,
  itemProductPrice: json['item_product_price'] as String,
  itemQuantity: (json['item_quantity'] as num).toInt(),
  itemTotal: json['item_total'] as String,
);

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
  'item_id': instance.itemId,
  'item_product_id': instance.itemProductId,
  'item_product_name': instance.itemProductName,
  'item_product_price': instance.itemProductPrice,
  'item_quantity': instance.itemQuantity,
  'item_total': instance.itemTotal,
};
