import 'package:flutter/material.dart';

class Bart extends StatelessWidget {
  Bart(this.messageParent,this.actionParent);

  final String messageParent;
  final ValueChanged <String> actionParent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Homer a dit : $messageParent'),
        Image.asset("images/Bart.png", width: 100),
        ElevatedButton(
          onPressed: () {
            actionParent("Homer tu es gros");
          },
          child: const Text('Envoyer le message à Homer'),
        ),
      ],
    );
  }
}
