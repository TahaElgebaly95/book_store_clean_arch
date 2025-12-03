import 'package:json_annotation/json_annotation.dart';

part 'show_single_order_model.g.dart';

@JsonSerializable()
class ShowSingleOrderModel {
  final SingleOrderData data;
  final String message;
  final List<dynamic> error;
  final int status;

  ShowSingleOrderModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory ShowSingleOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ShowSingleOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShowSingleOrderModelToJson(this);
}

@JsonSerializable()
class SingleOrderData {
  final int id;
  @JsonKey(name: 'order_code')
  final String orderCode;
  final String total;
  final String name;
  final String email;
  final String address;
  final String governorate;
  final String phone;
  final dynamic tax;
  @JsonKey(name: 'sub_total')
  final String subTotal;
  @JsonKey(name: 'order_date')
  final String orderDate;
  final String status;
  @JsonKey(name: 'reject_details')
  final dynamic rejectDetails;
  final dynamic notes;
  final int discount;
  @JsonKey(name: 'order_products')
  final List<OrderProductModel> orderProducts;

  SingleOrderData({
    required this.id,
    required this.orderCode,
    required this.total,
    required this.name,
    required this.email,
    required this.address,
    required this.governorate,
    required this.phone,
    this.tax,
    required this.subTotal,
    required this.orderDate,
    required this.status,
    this.rejectDetails,
    this.notes,
    required this.discount,
    required this.orderProducts,
  });

  factory SingleOrderData.fromJson(Map<String, dynamic> json) =>
      _$SingleOrderDataFromJson(json);
  Map<String, dynamic> toJson() => _$SingleOrderDataToJson(this);
}

@JsonSerializable()
class OrderProductModel {
  @JsonKey(name: 'order_product_id')
  final int orderProductId;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'product_price')
  final String productPrice;
  @JsonKey(name: 'product_discount')
  final int productDiscount;
  @JsonKey(name: 'product_price_after_discount')
  final double productPriceAfterDiscount;
  @JsonKey(name: 'order_product_quantity')
  final int orderProductQuantity;
  @JsonKey(name: 'product_total')
  final String productTotal;

  OrderProductModel({
    required this.orderProductId,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productDiscount,
    required this.productPriceAfterDiscount,
    required this.orderProductQuantity,
    required this.productTotal,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderProductModelToJson(this);
}