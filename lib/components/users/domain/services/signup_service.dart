import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:typa_frontend/components/users/data/models/user_session_model.dart';
import 'package:typa_frontend/components/users/data/repositories/users_repository_impl.dart';

@injectable
class SignupService {
  SignupService(this._usersRepository);
  final UsersRepositoryImpl _usersRepository;

  Future<bool> registerUser(
      String name,
      String phone,
      String username,
      String email,
      String pass) async {
    var sessionData = await _usersRepository.registerUser(
      name, 
      phone,
      username,
      email, 
      pass
    );
    var result = true;
    sessionData.fold((bool l) => { result = false }, (UserSessionModel userSession) async {
      var box = await Hive.openBox('tyba');
      box.put("session", {
        "id": userSession.email,
        "data": userSession.toJson()
      });
      result = true;
    });
    return result;
  }
}