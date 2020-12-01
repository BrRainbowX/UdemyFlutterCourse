import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/Botao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;
  final bool temPerguntaSelecionada;

  const Questionario(
      {Key key,
      @required this.perguntas,
      @required this.perguntaSelecionada,
      @required this.responder,
      @required this.temPerguntaSelecionada})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Questao(
          texto: perguntas[perguntaSelecionada]['texto'],
        ),
        ...respostas
            .map((e) => Botao(
                  texto: e['texto'],
                  quandoSelecionado: () => responder(e['pontuacao']),
                ))
            .toList()
      ],
    );
  }
}
