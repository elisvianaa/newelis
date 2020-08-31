import 'dart:convert';

import 'package:elis/app/modules/model/caso_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'caso_admin_controller.g.dart';

class CasoAdminController = _CasoAdminControllerBase with _$CasoAdminController;

abstract class _CasoAdminControllerBase with Store {
  @observable
  bool check = false;
  @observable
  String id = '';
  @observable
  ObservableList<CasoModel> caso = <CasoModel>[].asObservable();

  @action
  Future getCaso() async {
    var response =
        await http.get('http://192.168.15.3:8080/api/caso-clinicos/');
    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body) as List;
      caso.clear();
      data.forEach((element) async {
        caso.add(CasoModel.fromJson(element));
      });
    }
  }

  Future aproveCaso(id) async {
    var response = await http.patch(
        'http://192.168.15.3:8080/api/caso-clinicos/$id/',
        headers: {"Content-Type": "application/json"},
        body: json.encode({"status": true}));
    print(response.statusCode);
    print(response.body);
    getCaso();
  }
}
