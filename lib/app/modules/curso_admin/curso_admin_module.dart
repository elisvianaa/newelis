import 'curso_admin_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'curso_admin_page.dart';

class CursoAdminModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CursoAdminController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CursoAdminPage()),
      ];

  static Inject get to => Inject<CursoAdminModule>.of();
}
