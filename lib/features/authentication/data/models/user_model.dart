import 'package:auvnet_internship_assessment/core/constants/user_keys.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/entities/user_entity.dart';

class UserModel {
  final String email;
  final String? name;
  final String? address;

  UserModel({required this.email, this.name, this.address});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json[UserKeys.email.name],
      name: json[UserKeys.name.name],
      address: json[UserKeys.address.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserKeys.email.name: email,
      if (name != null) UserKeys.name.name: name,
      if (address != null) UserKeys.address.name: address,
    };
  }

  UserEntity toEntity() {
    return UserEntity(email: email, name: name, address: address);
  }
}
