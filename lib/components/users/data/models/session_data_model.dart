import 'package:equatable/equatable.dart';

class SessionDataModel extends Equatable {

  const SessionDataModel({
    required this.accessToken,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.username,
    required this.createdAt
  });

  final String accessToken;
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String username;
  final String createdAt;

  factory SessionDataModel.fromJson(Map<String, dynamic> json) {
    return SessionDataModel(
      accessToken: json['access_token'],
      id: (json['id'] as num).toInt(),
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      username: json["username"],
      createdAt: json["createdAt"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'username': username,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object> get props => [accessToken, id, name, email, phone, address, username, createdAt];
}