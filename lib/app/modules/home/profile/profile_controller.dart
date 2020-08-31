import 'dart:convert';

import 'package:elis/app/modules/model/formacao_model.dart';
import 'package:elis/app/modules/model/profile_model.dart';
import 'package:elis/app/modules/store/profile_store.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  UserStore userStore = Modular.get();
  final ProfileStore profileStore;

  _ProfileControllerBase(this.profileStore);

  @observable
  String nome = '';
  @observable
  String titulo = '';
  @observable
  String instituicao = '';
  @observable
  bool concluido = true;
  @observable
  ObservableList<FormacaoModel> formacao = <FormacaoModel>[].asObservable();
  @observable
  String psicologo = '';
  @observable
  String comboTitulo = '';
  @observable
  String data = '';

  @observable
  bool card = false;

  @action
  Future getProfile(id) async {
    var response =
        await http.get('http://192.168.15.3:8080/api/psicologos/$id');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var profile = ProfileModel.fromJson(data);
      profileStore.setProfile(profile);
      psicologo = profileStore.profileModel.id.toString();
    }
  }

  @action
  Future getFormacao() async {
    print(psicologo);
    var response = await http
        .get('http://192.168.15.3:8080/api/formacao/?psicologo=$psicologo');
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      formacao.clear();
      data.forEach((item) {
        formacao.add(FormacaoModel.fromJson(item));
      });
    }
  }

  @action
  Future addFormacao() async {
    if (card == false) {
      card = true;
    } else {
      var response = await http.post('http://192.168.15.3:8080/api/formacao/',
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "psicologo": profileStore.profileModel.id,
            "nome": nome,
            "titulo": comboTitulo,
            "instituicao": instituicao,
            "concluido": false,
            "data_conclusao": data
          }));
      getFormacao();
      print(response.statusCode);
      print(response.body);
      card = false;
      comboTitulo = 'Título';
    }
  }
}
