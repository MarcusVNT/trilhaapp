import 'package:flutter/material.dart';

class Tasks {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tasks(this._descricao, this._concluido);

  String getId() {
    return _id;
  }

  String getDescricao() {
    return _descricao;
  }

  void setDescricao(String descricao) {
    _descricao = descricao;
  }

  bool getConcluido() {
    return _concluido;
  }

  void setConcluido(bool concluido) {
    _concluido = concluido;
  }
}
