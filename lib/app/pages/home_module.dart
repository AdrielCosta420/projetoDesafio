
import 'package:flutter_modular/flutter_modular.dart';

import '../modules/home/home_Page.dart';

class HomeModule extends Module {
  @override

  List<ModularRoute> get routes => [ChildRoute('/', child: (context, args) => const HomePage())];
}