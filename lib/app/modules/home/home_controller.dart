import 'dart:convert';

import 'package:elis/app/modules/model/caso_comentario.dart';
import 'package:elis/app/modules/model/caso_model.dart';
import 'package:elis/app/modules/model/curso_comentario.dart';
import 'package:elis/app/modules/model/curso_model.dart';
import 'package:elis/app/modules/model/curso_viewmodel.dart';
import 'package:elis/app/modules/model/home_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<HomeViewModel> homeviewmodel =
      <HomeViewModel>[].asObservable();
  Future<List<CasoComentarioModel>> getCasoComentario(id) async {
    List<CasoComentarioModel> casocomentario = List<CasoComentarioModel>();
    var response = await http
        .get('http://192.168.15.3:8080/api/caso-comentarios/?caso=$id&author=');
    if (response.statusCode == 200) {
      var data = await json.decode(response.body) as List;
      print(id);
      print(response.body);
      data.forEach((element) async {
        casocomentario.add(CasoComentarioModel.fromJson(element));
      });
    }
    return casocomentario;
  }

  Future<List<CasoModel>> getCaso() async {
    List<CasoModel> caso = List<CasoModel>();
    var response =
        await http.get('http://192.168.15.3:8080/api/caso-clinicos/');
    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body) as List;
      data.forEach((element) async {
        caso.add(CasoModel.fromJson(element));
      });
    }
    return caso;
  }

  @action
  Future<void> load() async {
    var listCaso = await getCaso();
    for (var item in listCaso) {
      var listComentarios = await getCasoComentario(item.id);
      homeviewmodel.add(
        HomeViewModel(caso: item, comentario: listComentarios),
      );
    }
    homeviewmodel
        .sort((a, b) => b.comentario.length.compareTo(a.comentario.length));
  }

  ///Curso
  ///
  ///

  @observable
  ObservableList<CursoViewModel> cursoviewmodel =
      <CursoViewModel>[].asObservable();

  Future<List<CursoComentarioModel>> getCursoComentario(id) async {
    List<CursoComentarioModel> cursocomentario = List<CursoComentarioModel>();
    var response = await http
        .get('http://192.168.15.3:8080/api/c-comentarios/?caso=$id&author=');
    if (response.statusCode == 200) {
      var data = await json.decode(response.body) as List;
      print(id);
      print(response.body);
      data.forEach((element) async {
        cursocomentario.add(CursoComentarioModel.fromJson(element));
      });
    }
    return cursocomentario;
  }

  Future<List<CursoModel>> getCurso() async {
    List<CursoModel> curso = List<CursoModel>();
    var response =
        await http.get('http://192.168.15.3:8080/api/caso-clinicos/');
    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body) as List;
      data.forEach((element) async {
        curso.add(CursoModel.fromJson(element));
      });
    }
    return curso;
  }

  @action
  Future<void> loadCurso() async {
    var listCurso = await getCurso();
    for (var item in listCurso) {
      var listComentarios = await getCursoComentario(item.id);
      cursoviewmodel.add(
        CursoViewModel(curso: item, comentario: listComentarios),
      );
    }
    cursoviewmodel
        .sort((a, b) => b.comentario.length.compareTo(a.comentario.length));
  }
}
