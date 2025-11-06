// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  data:
      json['data'] == null
          ? null
          : OrderData.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData(
  orderId: (json['order_id'] as num?)?.toInt(),
  orderNumber: json['order_number'] as String?,
  orderDate: json['order_date'] as String?,
  orderStatus: json['order_status'] as String?,
  total: json['total'] as String?,
  shippingAddress: json['shipping_address'] as String?,
  paymentMethod: json['payment_method'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
  'order_id': instance.orderId,
  'order_number': instance.orderNumber,
  'order_date': instance.orderDate,
  'order_status': instance.orderStatus,
  'total': instance.total,
  'shipping_address': instance.shippingAddress,
  'payment_method': instance.paymentMethod,
  'items': instance.items,
};

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  productImage: json['product_image'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: json['price'] as String?,
  total: json['total'] as String?,
);

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
  'product_id': instance.productId,
  'product_name': instance.productName,
  'product_image': instance.productImage,
  'quantity': instance.quantity,
  'price': instance.price,
  'total': instance.total,
};
