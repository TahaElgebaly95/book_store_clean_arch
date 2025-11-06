import 'package:json_annotation/json_annotation.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FaqModel {
  @JsonKey(name: 'data')
  final FaqDataModel data;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'error')
  final List<dynamic> error;

  @JsonKey(name: 'status')
  final int status;

  FaqModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelToJson(this);
}

@JsonSerializable()
class FaqDataModel {
  @JsonKey(name: 'faqs')
  final List<FaqItemModel> faqs;

  FaqDataModel({required this.faqs});

  factory FaqDataModel.fromJson(Map<String, dynamic> json) =>
      _$FaqDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqDataModelToJson(this);
}

@JsonSerializable()
class FaqItemModel {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'question')
  final String question;

  @JsonKey(name: 'answer')
  final String answer;

  FaqItemModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FaqItemModel.fromJson(Map<String, dynamic> json) =>
      _$FaqItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqItemModelToJson(this);
}
