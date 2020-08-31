class CursoComentarioModel {
  int id;
  int curso;
  String nome;
  String descricao;
  String author;
  bool status;
  String createdAt;
  String modifiedAt;

  CursoComentarioModel(
      {this.id,
      this.curso,
      this.nome,
      this.descricao,
      this.author,
      this.status,
      this.createdAt,
      this.modifiedAt});

  CursoComentarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    curso = json['curso'];
    nome = json['nome'];
    descricao = json['descricao'];
    author = json['author'];
    status = json['status'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['curso'] = this.curso;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['author'] = this.author;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    return data;
  }
}
