// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteItem _$FavouriteItemFromJson(Map<String, dynamic> json) =>
    FavouriteItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: const NumFromStringConverter().fromJson(json['price'] as String?),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$FavouriteItemToJson(FavouriteItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': const NumFromStringConverter().toJson(instance.price),
      'image': instance.image,
    };

FavouriteModel _$FavouriteModelFromJson(Map<String, dynamic> json) =>
    FavouriteModel(
      data:
          json['data'] == null
              ? null
              : PaginationData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FavouriteModelToJson(FavouriteModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) =>
    PaginationData(
      currentPage: (json['current_page'] as num?)?.toInt(),
      dataFavItem:
          (json['data'] as List<dynamic>?)
              ?.map((e) => FavouriteItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'],
      lastPage: (json['last_page'] as num?)?.toInt(),
      lastPageUrl: json['last_page_url'] as String?,
      links:
          (json['links'] as List<dynamic>?)
              ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationDataToJson(PaginationData instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.dataFavItem?.map((e) => e.toJson()).toList(),
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links?.map((e) => e.toJson()).toList(),
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
  url: json['url'] as String?,
  label: json['label'] as String?,
  active: json['active'] as bool?,
);

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
  'url': instance.url,
  'label': instance.label,
  'active': instance.active,
};
