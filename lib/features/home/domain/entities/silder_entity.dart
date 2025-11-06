// ========== slider_entity.dart ==========
import 'package:equatable/equatable.dart';

class SliderEntity extends Equatable {
  final String imageUrl;

  const SliderEntity({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}