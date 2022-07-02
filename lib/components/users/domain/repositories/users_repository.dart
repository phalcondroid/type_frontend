import 'package:dartz/dartz.dart';
import 'package:typa_frontend/components/users/data/models/session_data_model.dart';

abstract class UsersRepository {
  Future<Either<bool, SessionDataModel>> validateUserAndPassword(String email, String pass);
}