// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../components/users/data/repositories/users_repository_impl.dart'
    as _i4;
import '../../components/users/domain/useCase/do_login_with_credentials.dart'
    as _i5;
import '../../components/users/presentation/bloc/login_cubit.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.LoginCubit>(_i3.LoginCubit(get<dynamic>()));
  gh.factory<_i4.UsersRepositoryImpl>(() => _i4.UsersRepositoryImpl());
  gh.factory<_i5.DoLoginWithCredentials>(
      () => _i5.DoLoginWithCredentials(get<_i4.UsersRepositoryImpl>()));
  return get;
}
