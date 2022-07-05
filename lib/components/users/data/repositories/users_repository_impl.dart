import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:http_auth/http_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:typa_frontend/components/users/data/models/session_model.dart';
import 'package:typa_frontend/components/users/data/models/user_session_model.dart';
import 'package:typa_frontend/components/users/domain/repositories/users_repository.dart';

@injectable
class UsersRepositoryImpl implements UsersRepository {

  @override
  Future<Either<bool, UserSessionModel>> getUserByPass(String email, String pass) async {
    var db = FirebaseFirestore.instance;
    CollectionReference users = db.collection("users");
    // Add a new document with a generated ID
    users
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: pass)
        .get()
        .then((QuerySnapshot snapshot) {
              for (var doc in snapshot.docs) {
                dynamic data = doc.data();
                return Right(UserSessionModel(
                  id: data!["id"],
                  name: data!["name"],
                  email: data!["email"],
                  phone: data!["phone"],
                  username: data!["username"],
                  password: data!["password"]
                ));
              }
            // return Right(res.docs.first);
          },
          onError: (e) => print("Error completing: $e"));
    return const Left(false);
  }

  @override
  Future<Either<bool, UserSessionModel>> registerUser(
      String name,
      String phone,
      String username,
      String email,
      String pass) async {
    var user = UserSessionModel(
        name: name,
        email: email,
        phone: phone,
        username: username,
        password: pass
    );
    try {
      var db = FirebaseFirestore.instance;
      // Add a new document with a generated ID
      await db.collection("users").add(user.toJson())
          .then((DocumentReference doc) async { })
          .catchError((e) => print("el hpta catch ${e}"))
          .onError((error, stackTrace) {
            print(" error : $error - $stackTrace");
          });
      return Right(user);
    } catch(e) {
      return const Left(false);
    }
  }
}