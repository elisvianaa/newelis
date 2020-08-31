import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'curso_admin_controller.dart';

class CursoAdminPage extends StatefulWidget {
  final String title;
  const CursoAdminPage({Key key, this.title = "CursoAdmin"}) : super(key: key);

  @override
  _CursoAdminPageState createState() => _CursoAdminPageState();
}

class _CursoAdminPageState
    extends ModularState<CursoAdminPage, CursoAdminController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.getCurso();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: sh * 0.9,
          child: Observer(builder: (_) {
            if (controller.curso.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: controller.curso.length,
                itemBuilder: (context, index) {
                  var curso = controller.curso[index];
                  if (curso.status == true) {
                    return SizedBox();
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: sh * 0.02),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: sh * 0.02,
                          horizontal: sw * 0.03,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.black26,
                                  offset: Offset(2, 2))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(curso.author),
                                Text(curso.createdAt)
                              ],
                            ),
                            SizedBox(
                              height: sh * 0.03,
                            ),
                            Text(curso.descricao),
                            SizedBox(
                              height: sh * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: sh * 0.05,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          ),
                                          onPressed: () {
                                            controller.aproveCurso(
                                              curso.id.toString(),
                                            );
                                          })
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            }
          }),
        ));
  }
}
