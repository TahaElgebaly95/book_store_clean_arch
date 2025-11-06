// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
  data: AuthDataModel.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String,
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'status': instance.status,
};

AuthDataModel _$AuthDataModelFromJson(Map<String, dynamic> json) =>
    AuthDataModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$AuthDataModelToJson(AuthDataModel instance) =>
    <String, dynamic>{'user': instance.user, 'token': instance.token};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  address: json['address'] as String?,
  city: json['city'] as String?,
  phone: json['phone'] as String?,
  emailVerified: json['email_verified'] as bool,
  image: json['image'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'address': instance.address,
  'city': instance.city,
  'phone': instance.phone,
  'email_verified': instance.emailVerified,
  'image': instance.image,
};
