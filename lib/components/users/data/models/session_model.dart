import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class SessionModel extends HiveObject {
  SessionModel({
    required this.id,
    required this.userId,
    required this.accessToken
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  String userId;

  @HiveField(2)
  String accessToken;
}