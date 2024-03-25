// Layout Básico:
// Crie um aplicativo Flutter com um layout básico contendo um Container, uma Column e
// uma Row.
// Adicione alguns widgets (por exemplo, Text, Icon, Image) dentro desses layouts para criar
// uma estrutura visual simples.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Básico'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                color: const Color.fromARGB(255, 33, 243, 128),
                child: Center(
                  child: Text(
                    'Container',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.star,
                    size: 50.0,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    size: 50.0,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    size: 50.0,
                    color: Colors.yellow,
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Image.asset(
                'assets/flutter_logo.png',
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
