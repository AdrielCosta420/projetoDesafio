import 'package:flutter_application_desafio/app/modules/users/users_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module{
  
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute,module: HomeModule()),
    ModuleRoute('/user', module: UsersModule())

  ];
}