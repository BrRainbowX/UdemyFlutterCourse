import 'package:flutter/material.dart';
import 'questao.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int perguntaSelecionada = 0;

  static const List<String> perguntas = [
    "Qual é a sua cor favorita?",
    "Qual é a sua cor não favorita?",
  ];

  void _responder() {
    if ((perguntas.length - 1) > perguntaSelecionada)
      setState(() => perguntaSelecionada++);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purple, accentColor: Colors.pinkAccent),
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              splashRadius: 25,
              splashColor: Colors.white.withOpacity(0.5),
              highlightColor: Colors.white.withOpacity(0.5),
              onPressed: () => null,
              color: Colors.white,
            ),
            centerTitle: true,
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
            actions: [
              IconButton(
                icon: Icon(Icons.account_circle_outlined),
                splashRadius: 25,
                splashColor: Colors.white.withOpacity(0.5),
                highlightColor: Colors.white.withOpacity(0.5),
                onPressed: () {},
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Questao(
                texto: perguntas[perguntaSelecionada],
              ),
              RaisedButton(
                onPressed: _responder,
                child: Text('Resposta 1'),
              ),
              RaisedButton(
                onPressed: _responder,
                child: Text('Resposta 2'),
              ),
              RaisedButton(
                onPressed: _responder,
                child: Text('Resposta 3'),
              )
            ],
          )),
    );
  }
}
