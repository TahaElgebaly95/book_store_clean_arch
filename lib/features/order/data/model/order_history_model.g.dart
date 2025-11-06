// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryModel _$OrderHistoryModelFromJson(Map<String, dynamic> json) =>
    OrderHistoryModel(
      data: OrderHistoryData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      error: json['error'] as List<dynamic>,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$OrderHistoryModelToJson(OrderHistoryModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

OrderHistoryData _$OrderHistoryDataFromJson(Map<String, dynamic> json) =>
    OrderHistoryData(
      orders:
          (json['orders'] as List<dynamic>)
              .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      links: LinksModel.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderHistoryDataToJson(OrderHistoryData instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'meta': instance.meta,
      'links': instance.links,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: (json['id'] as num).toInt(),
  orderCode: json['order_code'] as String,
  orderDate: json['order_date'] as String,
  status: json['status'] as String,
  total: json['total'] as String,
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_code': instance.orderCode,
      'order_date': instance.orderDate,
      'status': instance.status,
      'total': instance.total,
    };

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
  total: (json['total'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  currentPage: (json['current_page'] as num).toInt(),
  lastPage: (json['last_page'] as num).toInt(),
);

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
  'total': instance.total,
  'per_page': instance.perPage,
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
};

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) => LinksModel(
  first: json['first'] as String,
  last: json['last'] as String,
  prev: json['prev'] as String?,
  next: json['next'] as String?,
);

Map<String, dynamic> _$LinksModelToJson(LinksModel instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };
