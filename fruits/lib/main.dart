import 'package:flutter/material.dart';
import 'package:prime_numbers/prime_numbers.dart';

import 'dart:math';
import 'dart:core';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> _incrementNumber = [];
  final List<String> fruits = ["ananas","poire","pomme"];
  void _incrementCounter() {
    setState(() {
      _counter++;
      _incrementNumber.add(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _incrementNumber.length,
                  itemBuilder: (BuildContext context, int index) {
                    
                    return ListTile(
                      tileColor: (index+1).isEven ? Colors.indigo : Colors.cyan,
                      leading :
                          (index+1).isPrime  ? Image.asset('images/ananas.png') : index.isEven ? Image.asset('images/poire.png') : Image.asset('images/pomme.png') ,
                          title: Text(
                            "Numéro ${_incrementNumber[index]}"
                          )
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



  bool isPrimeNumber(int number) {
  // Les nombres inférieurs à 2 ne sont pas premiers
  if (number < 2) {
    return false;
  }
  
  // Vérifiez la divisibilité pour des nombres allant de 2 à la racine carrée de `number`
  for (int i = 2; i <= sqrt(number); i++) {
    if (number % i == 0) {
      // Si `number` est divisible par `i`, alors ce n'est pas un nombre premier
      return false;
    }
  }
  
  // Si aucune division entière n'a été trouvée, alors `number` est premier
  return true;
}

}
