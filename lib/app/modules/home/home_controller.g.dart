// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$homeviewmodelAtom = Atom(name: '_HomeControllerBase.homeviewmodel');

  @override
  ObservableList<HomeViewModel> get homeviewmodel {
    _$homeviewmodelAtom.reportRead();
    return super.homeviewmodel;
  }

  @override
  set homeviewmodel(ObservableList<HomeViewModel> value) {
    _$homeviewmodelAtom.reportWrite(value, super.homeviewmodel, () {
      super.homeviewmodel = value;
    });
  }

  final _$cursoviewmodelAtom = Atom(name: '_HomeControllerBase.cursoviewmodel');

  @override
  ObservableList<CursoViewModel> get cursoviewmodel {
    _$cursoviewmodelAtom.reportRead();
    return super.cursoviewmodel;
  }

  @override
  set cursoviewmodel(ObservableList<CursoViewModel> value) {
    _$cursoviewmodelAtom.reportWrite(value, super.cursoviewmodel, () {
      super.cursoviewmodel = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_HomeControllerBase.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  final _$loadCursoAsyncAction = AsyncAction('_HomeControllerBase.loadCurso');

  @override
  Future<void> loadCurso() {
    return _$loadCursoAsyncAction.run(() => super.loadCurso());
  }

  @override
  String toString() {
    return '''
homeviewmodel: ${homeviewmodel},
cursoviewmodel: ${cursoviewmodel}
    ''';
  }
}
