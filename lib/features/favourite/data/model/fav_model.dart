// fav_model.dart (الكود الكامل والنهائي)
import 'package:json_annotation/json_annotation.dart';

part 'fav_model.g.dart';

class NumFromStringConverter implements JsonConverter<num?, String?> {
  const NumFromStringConverter();

  @override
  num? fromJson(String? json) {
    if (json == null) return null;
    return num.tryParse(json);
  }

  @override
  String? toJson(num? object) {
    return object?.toString();
  }
}

@JsonSerializable()
class FavouriteItem {
  final int? id;
  final String? name;

  @NumFromStringConverter()
  final num? price;

  final String? image;

  FavouriteItem({this.id, this.name, this.price, this.image});

  factory FavouriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavouriteItemFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FavouriteModel {
  PaginationData? data;
  String? message;
  List<dynamic>? error;
  int? status;

  FavouriteModel({this.data, this.message, this.error, this.status});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteModelToJson(this);
}

// --- Pagination Data Model ---
@JsonSerializable(explicitToJson: true)
class PaginationData {
  @JsonKey(name: 'current_page')
  int? currentPage;

  @JsonKey(name: 'data')
  List<FavouriteItem>? dataFavItem;

  @JsonKey(name: 'first_page_url')
  String? firstPageUrl;

  dynamic from;

  @JsonKey(name: 'last_page')
  int? lastPage;

  @JsonKey(name: 'last_page_url')
  String? lastPageUrl;

  List<Link>? links;

  @JsonKey(name: 'next_page_url')
  dynamic nextPageUrl;

  String? path;

  @JsonKey(name: 'per_page')
  int? perPage;

  @JsonKey(name: 'prev_page_url')
  dynamic prevPageUrl;

  dynamic to;
  int? total;

  PaginationData({
    this.currentPage,
    this.dataFavItem,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory PaginationData.fromJson(Map<String, dynamic> json) =>
      _$PaginationDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDataToJson(this);
}

@JsonSerializable()
class Link {
  String? url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
