import 'curso_comentario.dart';
import 'curso_model.dart';

class CursoViewModel {
  CursoModel curso;
  List<CursoComentarioModel> comentario;

  CursoViewModel({this.curso, this.comentario});
}
