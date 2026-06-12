import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.token,
  });

  factory UserModel.fromJson(
      Map<String, dynamic> json,
      String token,
      ) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      token: token,
    );
  }
}