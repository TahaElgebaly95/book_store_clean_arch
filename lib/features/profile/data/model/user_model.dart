
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
   const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    // super.image,
    required super.city,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      //image: json['image'],
      city: json['city'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
     // 'image': image,
      'city': city,
      'address': address,
    };
  }
}