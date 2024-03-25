// Uso do Stack:
// Explore o uso do widget Stack para sobrepor widgets na tela.
// Crie um exemplo com dois ou mais widgets sobrepostos e ajuste suas posições.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StackExample(),
    );
  }
}

class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de Stack'),
      ),
      body: Stack(
        children: [
          // Widget de fundo
          Container(
            color: Color.fromARGB(255, 238, 224, 193),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          // Widget sobreposto 1
          Positioned(
            top: 100,
            left: 50,
            child: Container(
              width: 200,
              height: 200,
              color: Color.fromARGB(255, 227, 93, 231),
              child: Center(
                child: Text(
                  'Widget Sobreposto 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          // Widget sobreposto 2
          Positioned(
            top: 200,
            left: 150,
            child: Container(
              width: 200,
              height: 200,
              color: Color.fromARGB(255, 160, 74, 231),
              child: Center(
                child: Text(
                  'Widget Sobreposto 2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
