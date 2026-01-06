import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final UserEntity user;
  final String token;

  const AuthEntity({
    required this.user,
    required this.token,
  });

  @override
  List<Object?> get props => [user, token];
}

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? address;
  final String? city;
  final String? phone;
  final bool emailVerified;
  final String? image;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.address,
    this.city,
    this.phone,
    required this.emailVerified,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, email, address, city, phone, emailVerified, image];
}
