import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderModel {
  final OrderData? data;
  final String? message;
  final int? status;

  OrderModel({this.data, this.message, this.status});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderData {
  final int? orderId;
  final String? orderNumber;
  final String? orderDate;
  final String? orderStatus;
  final String? total;
  final String? shippingAddress;
  final String? paymentMethod;
  final List<OrderItem>? items;

  OrderData({
    this.orderId,
    this.orderNumber,
    this.orderDate,
    this.orderStatus,
    this.total,
    this.shippingAddress,
    this.paymentMethod,
    this.items,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderItem {
  final int? productId;
  final String? productName;
  final String? productImage;
  final int? quantity;
  final String? price;
  final String? total;

  OrderItem({
    this.productId,
    this.productName,
    this.productImage,
    this.quantity,
    this.price,
    this.total,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

// Run: flutter pub run build_runner build --delete-conflicting-outputs