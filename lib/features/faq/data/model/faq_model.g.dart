// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => FaqModel(
  data: FaqDataModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String,
  error: json['error'] as List<dynamic>,
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$FaqModelToJson(FaqModel instance) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'error': instance.error,
  'status': instance.status,
};

FaqDataModel _$FaqDataModelFromJson(Map<String, dynamic> json) => FaqDataModel(
  faqs:
      (json['faqs'] as List<dynamic>)
          .map((e) => FaqItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$FaqDataModelToJson(FaqDataModel instance) =>
    <String, dynamic>{'faqs': instance.faqs};

FaqItemModel _$FaqItemModelFromJson(Map<String, dynamic> json) => FaqItemModel(
  id: (json['id'] as num).toInt(),
  question: json['question'] as String,
  answer: json['answer'] as String,
);

Map<String, dynamic> _$FaqItemModelToJson(FaqItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };
