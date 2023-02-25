import'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/core/DI/service_locator.config.dart';


final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: 'init',
  generateForDir: ['lib'],
)  
void configureDependencies() => getIt.init();