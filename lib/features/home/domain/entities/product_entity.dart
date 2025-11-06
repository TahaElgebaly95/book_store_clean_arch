// ========== product_entity.dart ==========

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String price;
  final int discount;
  final double priceAfterDiscount;
  final int stock;
  final bool isBestSeller;
  final String imageUrl;
  final String category;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.stock,
    required this.isBestSeller,
    required this.imageUrl,
    required this.category,
  });

  bool get hasDiscount => discount > 0;
  bool get isInStock => stock > 0;

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    price,
    discount,
    priceAfterDiscount,
    stock,
    isBestSeller,
    imageUrl,
    category,
  ];
}
