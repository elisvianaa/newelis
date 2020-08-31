// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_admin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CursoAdminController on _CursoAdminControllerBase, Store {
  final _$cursoAtom = Atom(name: '_CursoAdminControllerBase.curso');

  @override
  ObservableList<CursoModel> get curso {
    _$cursoAtom.reportRead();
    return super.curso;
  }

  @override
  set curso(ObservableList<CursoModel> value) {
    _$cursoAtom.reportWrite(value, super.curso, () {
      super.curso = value;
    });
  }

  final _$getCursoAsyncAction =
      AsyncAction('_CursoAdminControllerBase.getCurso');

  @override
  Future<dynamic> getCurso() {
    return _$getCursoAsyncAction.run(() => super.getCurso());
  }

  @override
  String toString() {
    return '''
curso: ${curso}
    ''';
  }
}
