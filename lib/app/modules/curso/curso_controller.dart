import 'dart:convert';

import 'package:elis/app/modules/curso/curso_page.dart';
import 'package:elis/app/modules/model/curso_model.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'curso_controller.g.dart';

class CursoController = _CursoControllerBase with _$CursoController;

abstract class _CursoControllerBase with Store {
  UserStore user = Modular.get();
  @observable
  String id;
  @observable
  bool card = false;
  @observable
  String cursonome = '';
  @observable
  String cursodescricao = '';
  @observable
  String qtdhoras = '';
  @observable
  String local = '';
  @observable
  String data = '';
  @observable
  String hora = '';

  @observable
  TextEditingController controller1 = TextEditingController();
  @observable
  TextEditingController controller2 = TextEditingController();
  @observable
  TextEditingController controller3 = TextEditingController();
  @observable
  TextEditingController controller4 = TextEditingController();
  @observable
  TextEditingController controller5 = TextEditingController();
  @observable
  TextEditingController controller6 = TextEditingController();

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

  @action
  Future setCurso() async {
    if (card == false) {
      card = true;
    } else {
      var response = await http.post(
        'http://192.168.15.3:8080/api/cursos/',
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "nome": cursonome,
          "descricao": cursodescricao,
          "author": user.userModel.username,
          "qtd_horas": qtdhoras,
          "local": local,
          "data": data,
          "hora": hora,
          "status": false
        }),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        card = false;
        getCurso();
        controller1.clear();
        controller2.clear();
        controller3.clear();
        controller4.clear();
        controller5.clear();
        controller6.clear();
      } else {
        getCurso();
        card = false;
      }
    }
  }

  @action
  Future deletcurso(id) async {
    var response =
        await http.delete('http://192.168.15.3:8080/api/cursos/$id/');
    getCurso();
  }
}
