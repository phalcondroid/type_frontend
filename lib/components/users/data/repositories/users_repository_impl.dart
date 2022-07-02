import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:typa_frontend/components/users/data/models/session_data_model.dart';
import 'package:typa_frontend/components/users/domain/repositories/users_repository.dart';

@injectable
class UsersRepositoryImpl implements UsersRepository {

  @override
  Future<Either<bool, SessionDataModel>> validateUserAndPassword(String email, String pass) async {
    final response =
      await http.post(
        Uri.parse('http://localhost:3000/v1/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': email,
          'password': pass
        }),
      );
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data.toString());
      return const Right(SessionDataModel(
        accessToken: "",
        id: 0,
        name: "",
        email: "",
        phone: "",
        username: "",
        address: "",
        createdAt: ""
      ));
    }
    return const Left(false);
  }
}