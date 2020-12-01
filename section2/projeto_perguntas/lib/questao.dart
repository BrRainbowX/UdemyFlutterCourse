import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28, color: Theme.of(context).primaryColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
