import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/auth_entity.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  @JsonKey(name: 'data')
  final AuthDataModel data;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'status')
  final int status;

  AuthModel({required this.data, required this.message, required this.status});

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  AuthEntity toEntity() =>
      AuthEntity(user: data.user.toEntity(), token: data.token);
}

@JsonSerializable()
class AuthDataModel {
  @JsonKey(name: 'user')
  final UserModel user;
  @JsonKey(name: 'token')
  final String token;

  AuthDataModel({required this.user, required this.token});

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @JsonKey(name: 'image')
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.address,
    this.city,
    this.phone,
    required this.emailVerified,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
    id: id,
    name: name,
    email: email,
    address: address,
    city: city,
    phone: phone,
    emailVerified: emailVerified,
    image: image,
  );
}
