import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacao = 0;

  static const List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 1},
        {'texto': 'Vermelho', 'pontuacao': 2},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 4},
      ]
    },
    {
      'texto': 'Qual é a seu animal favorita?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 1},
        {'texto': 'Gato', 'pontuacao': 2},
        {'texto': 'Rato', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 4}
      ]
    },
    {
      'texto': 'Qual é a sua IDE favorita?',
      'respostas': [
        {'texto': 'Studio', 'pontuacao': 1},
        {'texto': 'IntelliJ', 'pontuacao': 2},
        {'texto': 'VSCode', 'pontuacao': 3},
        {'texto': 'Sublime', 'pontuacao': 4}
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      _pontuacao += pontuacao;
      _perguntaSelecionada++;
    });
  }

  void _resetar() => setState(() {
        _pontuacao = 0;
        _perguntaSelecionada = 0;
      });

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purple, accentColor: Colors.pinkAccent),
      home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.help_outline_sharp,
                    color: Colors.white,
                  ),
                ),
                Text('Pergunta'),
              ],
            ),
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            switchInCurve: Curves.fastLinearToSlowEaseIn,
            child: temPerguntaSelecionada
                ? Questionario(
                    key: ValueKey(_perguntaSelecionada),
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder,
                    temPerguntaSelecionada: temPerguntaSelecionada,
                  )
                : Resultado(
                    pontuacao: _pontuacao,
                    resetar: _resetar,
                  ),
          )),
    );
  }
}
