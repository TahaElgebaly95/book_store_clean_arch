
// 1. هذا السطر يربط الملف بالملف الذي سيتم إنشاؤه
import 'package:json_annotation/json_annotation.dart';

part 'ckechout_model.g.dart';

// 2. الكلاس الرئيسي
@JsonSerializable()
class CheckOutModel {
  final CheckOutData data;
  final String message;
  final List<dynamic> error;
  final int status;

  CheckOutModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  // 3. هذه الدوال هي التي سيقوم build_runner بكتابة الكود الخاص بها
  factory CheckOutModel.fromJson(Map<String, dynamic> json) =>
      _$CheckOutModelFromJson(json);
  Map<String, dynamic> toJson() => _$CheckOutModelToJson(this);
}

// 4. كلاس البيانات الداخلي
@JsonSerializable()
class CheckOutData {
  final int id;
  final UserData user;
  final String total;
  @JsonKey(name: 'cart_items') // لربط اسم الحقل بالـ JSON
  final List<CartItem> cartItems;

  CheckOutData({
    required this.id,
    required this.user,
    required this.total,
    required this.cartItems,
  });

  factory CheckOutData.fromJson(Map<String, dynamic> json) =>
      _$CheckOutDataFromJson(json);
  Map<String, dynamic> toJson() => _$CheckOutDataToJson(this);
}

// 5. كلاس بيانات المستخدم
@JsonSerializable()
class UserData {
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'user_name')
  final String userName;
  final String? address; // علامة ؟ لأنه قد يكون null
  final String? phone;   // علامة ؟ لأنه قد يكون null
  final String? email;

  UserData(this.email, {
    required this.userId,
    required this.userName,
    this.address,
    this.phone,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

// 6. كلاس عناصر السلة
@JsonSerializable()
class CartItem {
  @JsonKey(name: 'item_id')
  final int itemId;
  @JsonKey(name: 'item_product_id')
  final int itemProductId;
  @JsonKey(name: 'item_product_name')
  final String itemProductName;
  @JsonKey(name: 'item_product_price')
  final String itemProductPrice;
  @JsonKey(name: 'item_quantity')
  final int itemQuantity;
  @JsonKey(name: 'item_total')
  final String itemTotal;

  CartItem({
    required this.itemId,
    required this.itemProductId,
    required this.itemProductName,
    required this.itemProductPrice,
    required this.itemQuantity,
    required this.itemTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}