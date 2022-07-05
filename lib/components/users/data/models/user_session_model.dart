
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserSessionModel extends HiveObject {
  UserSessionModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.password
  });

  @HiveField(0)
  String? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String phone;

  @HiveField(5)
  String username;

  @HiveField(6)
  String password;

  factory UserSessionModel.fromJson(Map<String, dynamic> json) {
    return UserSessionModel(
        id: json['id'] ?? "",
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password
    };
  }
}
