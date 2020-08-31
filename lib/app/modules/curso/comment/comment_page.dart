import 'package:elis/app/modules/model/curso_model.dart';
import 'package:elis/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getwidget/getwidget.dart';
import 'comment_controller.dart';

class CommentPage extends StatefulWidget {
  final String title;
  final CursoModel comment;
  const CommentPage({Key key, this.title = "Comment", @required this.comment})
      : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends ModularState<CommentPage, CommentController> {
  //use 'controller' variable to access controller
  UserStore user = Modular.get();
  TextEditingController _controller1 = TextEditingController();
  @override
  void initState() {
    controller.idcurso = widget.comment.id.toString();
    controller.getcurso();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.comment.nome),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                controller.setCursoComentario(user.userModel.username);
                _controller1.clear();
              })
        ],
      ),
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: sh * 0.9,
                      width: sw,
                      padding: EdgeInsets.symmetric(vertical: sh * 0.01),
                      color: Colors.white,
                      child: Observer(
                        builder: (context) {
                          if (controller.curso.isEmpty) {
                            return Center(
                              child: Text('Nenhum Comentario'),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: controller.curso.length,
                              itemBuilder: (context, index) {
                                var comentario = controller.curso[index];
                                if (comentario.status == false) {
                                  return SizedBox();
                                } else {
                                  return ListTile(
                                    title: Row(
                                      children: [
                                        Text(comentario.author),
                                      ],
                                    ),
                                    subtitle: Text(comentario.descricao),
                                    trailing: comentario.author ==
                                            user.userModel.username
                                        ? IconButton(
                                            icon: Icon(Icons.delete),
                                            color: Colors.red,
                                            onPressed: () {
                                              controller.deleteCasoCurso(
                                                comentario.id,
                                              );
                                            },
                                          )
                                        : SizedBox(),
                                  );
                                }
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.elasticOut,
                  bottom: controller.card == true ? 0 : -sh * 0.8,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: sh * 0.03, horizontal: sw * 0.03),
                    height: sh * 0.5,
                    color: Colors.white,
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.elasticOut,
                  bottom: controller.card == true ? 0 : -sh * 0.8,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: sh * 0.03, horizontal: sw * 0.03),
                    height: sh * 0.5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: sh * 0.01),
                          child: Container(
                            height: sh * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.grey,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                sh * 0.02,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: sw * 0.03, vertical: sh * 0.01),
                            child: TextFormField(
                              controller: _controller1,
                              minLines: null,
                              maxLines: null,
                              maxLength: 250,
                              expands: true,
                              onChanged: (value) {
                                controller.descricao = value;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Descrição',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
