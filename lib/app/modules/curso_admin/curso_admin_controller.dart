import 'dart:convert';

import 'package:elis/app/modules/model/curso_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'curso_admin_controller.g.dart';

@Injectable()
class CursoAdminController = _CursoAdminControllerBase
    with _$CursoAdminController;

abstract class _CursoAdminControllerBase with Store {
  @observable
  ObservableList<CursoModel> curso = <CursoModel>[].asObservable();

  @action
  Future getCurso() async {
    var response = await http.get('http://192.168.15.3:8080/api/cursos/');
    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body) as List;
      curso.clear();
      data.forEach((element) async {
        curso.add(CursoModel.fromJson(element));
      });
    }
  }

  Future aproveCurso(id) async {
    var response = await http.patch('http://192.168.15.3:8080/api/cursos/$id/',
        headers: {"Content-Type": "application/json"},
        body: json.encode({"status": true}));
    print(response.statusCode);
    print(response.body);
    getCurso();
  }
}
