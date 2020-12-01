import 'package:flutter/material.dart';
import 'package:projeto_perguntas/Botao.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() resetar;

  const Resultado({
    Key key,
    @required this.pontuacao,
    @required this.resetar,
  }) : super(key: key);

  String get fraseResultado {
    if (pontuacao <= 3) {
      return 'Parabéns!';
    } else if (pontuacao <= 6) {
      return 'Bom trabalho!';
    } else {
      return 'Você é um jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style:
                TextStyle(fontSize: 32, color: Theme.of(context).primaryColor),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * .4,
            margin: const EdgeInsets.all(10),
            child: OutlineButton(
                onPressed: resetar,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                color: Theme.of(context).primaryColor,
                splashColor: Colors.white,
                highlightColor: Theme.of(context).canvasColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings_backup_restore_sharp),
                      splashRadius: 25,
                      hoverColor: Theme.of(context).accentColor,
                      focusColor: Theme.of(context).accentColor,
                      splashColor: Theme.of(context).accentColor,
                      highlightColor: Theme.of(context).accentColor,
                      disabledColor: Theme.of(context).accentColor,
                      onPressed: resetar,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Reiniciar?',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}
