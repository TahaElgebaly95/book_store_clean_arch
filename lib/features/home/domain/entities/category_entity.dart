// ========== category_entity.dart ==========
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final int productsCount;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.productsCount,
  });

  @override
  List<Object?> get props => [id, name, productsCount];
}