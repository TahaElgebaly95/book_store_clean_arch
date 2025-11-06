// ========== 2. category_model.dart ==========
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/category_entity.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'products_count')
  final int productsCount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.productsCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryEntity toEntity() => CategoryEntity(
    id: id,
    name: name,
    productsCount: productsCount,
  );
}