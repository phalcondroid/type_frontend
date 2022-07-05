import 'package:dartz/dartz.dart';
import 'package:typa_frontend/components/users/data/models/user_session_model.dart';

abstract class UsersRepository {
  Future<Either<bool, UserSessionModel>> getUserByPass(String email, String pass);
  Future<Either<bool, UserSessionModel>> registerUser(String name, String phone, String username, String email, String pass);
}