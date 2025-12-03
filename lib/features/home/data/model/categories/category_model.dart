// ========== category_model.dart (FIXED) ==========
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/category_entity.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'products_count')
  final int? productsCount;

  CategoryModel({
    this.id,
    this.name,
    this.productsCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  // ✅ Safe conversion with null checks
  CategoryEntity toEntity() => CategoryEntity(
    id: id ?? 0,
    name: name ?? 'Unknown Category',
    productsCount: productsCount ?? 0,
  );
}