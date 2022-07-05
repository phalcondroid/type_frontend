// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../components/places/data/repositories/place_repository_impl.dart'
    as _i3;
import '../../components/places/domain/actions/places_service.dart' as _i4;
import '../../components/places/presentation/bloc/places_cubit.dart' as _i7;
import '../../components/users/data/repositories/users_repository_impl.dart'
    as _i5;
import '../../components/users/domain/services/login_service.dart' as _i6;
import '../../components/users/domain/services/signup_service.dart' as _i8;
import '../../components/users/presentation/bloc/login_form_cubit.dart' as _i9;
import '../../components/users/presentation/bloc/signup_form_cubit.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.PlaceRepositoryImpl>(_i3.PlaceRepositoryImpl());
  gh.factory<_i4.PlacesService>(
      () => _i4.PlacesService(get<_i3.PlaceRepositoryImpl>()));
  gh.factory<_i5.UsersRepositoryImpl>(() => _i5.UsersRepositoryImpl());
  gh.factory<_i6.LoginService>(
      () => _i6.LoginService(get<_i5.UsersRepositoryImpl>()));
  gh.factory<_i7.PlacesCubit>(() => _i7.PlacesCubit(get<_i4.PlacesService>()));
  gh.factory<_i8.SignupService>(
      () => _i8.SignupService(get<_i5.UsersRepositoryImpl>()));
  gh.singleton<_i9.LoginFormCubit>(_i9.LoginFormCubit(get<_i6.LoginService>()));
  gh.singleton<_i10.SignupFormCubit>(
      _i10.SignupFormCubit(get<_i8.SignupService>()));
  return get;
}
