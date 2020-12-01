import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Botao({Key key, this.texto, this.quandoSelecionado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .45,
      margin: const EdgeInsets.all(5),
      child: RaisedButton(
        padding:
            const EdgeInsets.only(left: 40, top: 15, bottom: 15, right: 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        onPressed: quandoSelecionado,
        color: Theme.of(context).primaryColor,
        splashColor: Colors.white,
        highlightColor: Theme.of(context).canvasColor,
        textColor: Colors.white,
        child: Text(texto),
      ),
    );
  }
}
