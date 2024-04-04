import 'package:flutter/material.dart';
import 'package:simpson/bart.dart';

class Homer extends StatefulWidget {
  const Homer({super.key});

  @override
  State<Homer> createState() => _HomerState();
}

class _HomerState extends State<Homer> with SingleTickerProviderStateMixin{
  final myController = TextEditingController();
  String messageForChild = "";
  String messageFromChild = "";


  _updateMessageFromChild(String messageFromChild)
  {
    setState(() {
      this.messageFromChild = messageFromChild;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Les simpsons'),
        ),
        body: Center(
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'images/Homer.png',
                      width: 100,
                    ),
                    Expanded(
                      child: TextField(
                        controller: myController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Homer talk :',
                        ),
                      ),
                    ),
                    Text('Message du connard de fils : $messageFromChild'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          messageForChild = myController.text;
                        });
                      },
                      child:
                          const Text('Envoie le message à son connard de fils'),
                    ),
                  ],
                ),
              ),
              Expanded(child: Bart( myController.text, _updateMessageFromChild))
            ],
          ),
        ),
      ),
    );
  }
} 
