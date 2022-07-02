
import 'package:injectable/injectable.dart';
import 'package:typa_frontend/components/users/data/repositories/users_repository_impl.dart';

@injectable
class DoLoginWithCredentials {

  DoLoginWithCredentials(
    this._usersRepository
  );

  final String email;
  final String pass;
  final UsersRepositoryImpl _usersRepository;

  bool validate() {
    return true;
  }
}