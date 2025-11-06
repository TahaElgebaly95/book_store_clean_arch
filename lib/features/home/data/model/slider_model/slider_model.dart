// ========== 3. slider_model.dart ==========
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/silder_entity.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {
  @JsonKey(name: 'image')
  final String image;

  SliderModel({required this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  SliderEntity toEntity() => SliderEntity(imageUrl: image);
}
