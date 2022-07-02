import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:typa_frontend/core/injectable/configuration.config.dart';

final getIt = GetIt.instance;  
  
@InjectableInit()  
void configureInjection(String env) 
  => $initGetIt(getIt, environment: env);