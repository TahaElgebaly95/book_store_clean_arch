import 'package:json_annotation/json_annotation.dart';
part 'contact_us_model.g.dart';

@JsonSerializable()
class ContactUsModel {
  @JsonKey(name: 'data')
  final List<dynamic> data;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'error')
  final List<dynamic> error;

  @JsonKey(name: 'status')
  final int status;

  ContactUsModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsModelToJson(this);
}