// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_single_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowSingleOrderModel _$ShowSingleOrderModelFromJson(
  Map<String, dynamic> json,
) => ShowSingleOrderModel(
  data: SingleOrderData.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String,
  error: json['error'] as List<dynamic>,
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$ShowSingleOrderModelToJson(
  ShowSingleOrderModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
  'status': instance.status,
};

SingleOrderData _$SingleOrderDataFromJson(Map<String, dynamic> json) =>
    SingleOrderData(
      id: (json['id'] as num).toInt(),
      orderCode: json['order_code'] as String,
      total: json['total'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      governorate: json['governorate'] as String,
      phone: json['phone'] as String,
      tax: json['tax'],
      subTotal: json['sub_total'] as String,
      orderDate: json['order_date'] as String,
      status: json['status'] as String,
      rejectDetails: json['reject_details'],
      notes: json['notes'],
      discount: (json['discount'] as num).toInt(),
      orderProducts:
          (json['order_products'] as List<dynamic>)
              .map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SingleOrderDataToJson(SingleOrderData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_code': instance.orderCode,
      'total': instance.total,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'governorate': instance.governorate,
      'phone': instance.phone,
      'tax': instance.tax,
      'sub_total': instance.subTotal,
      'order_date': instance.orderDate,
      'status': instance.status,
      'reject_details': instance.rejectDetails,
      'notes': instance.notes,
      'discount': instance.discount,
      'order_products': instance.orderProducts,
    };

OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) =>
    OrderProductModel(
      orderProductId: (json['order_product_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      productPrice: json['product_price'] as String,
      productDiscount: (json['product_discount'] as num).toInt(),
      productPriceAfterDiscount:
          (json['product_price_after_discount'] as num).toDouble(),
      orderProductQuantity: (json['order_product_quantity'] as num).toInt(),
      productTotal: json['product_total'] as String,
    );

Map<String, dynamic> _$OrderProductModelToJson(OrderProductModel instance) =>
    <String, dynamic>{
      'order_product_id': instance.orderProductId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'product_discount': instance.productDiscount,
      'product_price_after_discount': instance.productPriceAfterDiscount,
      'order_product_quantity': instance.orderProductQuantity,
      'product_total': instance.productTotal,
    };
