import 'package:json_annotation/json_annotation.dart';
part 'order_history_model.g.dart';

@JsonSerializable()
class OrderHistoryModel {
  final OrderHistoryData data;
  final String message;
  final List<dynamic> error;
  final int status;

  OrderHistoryModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderHistoryModelToJson(this);
}

@JsonSerializable()
class OrderHistoryData {
  final List<OrderModel> orders;
  final MetaModel meta;
  final LinksModel links;

  OrderHistoryData({
    required this.orders,
    required this.meta,
    required this.links,
  });

  factory OrderHistoryData.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$OrderHistoryDataToJson(this);
}

@JsonSerializable()
class OrderModel {
  final int id;
  @JsonKey(name: 'order_code')
  final String orderCode;
  @JsonKey(name: 'order_date')
  final String orderDate;
  final String status;
  final String total;

  OrderModel({
    required this.id,
    required this.orderCode,
    required this.orderDate,
    required this.status,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class MetaModel {
  final int total;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'last_page')
  final int lastPage;

  MetaModel({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}

@JsonSerializable()
class LinksModel {
  final String first;
  final String last;
  final String? prev; // 4. قابل ليكون null
  final String? next; // 4. قابل ليكون null

  LinksModel({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);
  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}