// Personalização de Botões:
// Crie um conjunto de botões interativos (ElevatedButton, TextButton, OutlinedButton) com
// diferentes estilos.
// Personalize a aparência dos botões, alterando cores, tamanhos e adicionando ícones.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ButtonExample(),
    );
  }
}

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de Botões'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Color.fromARGB(255, 238, 53, 229), // Cor do texto
                padding: EdgeInsets.all(16.0), // Espaçamento interno
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Borda arredondada
                ),
              ),
              child: Text('ElevatedButton'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 72, 240, 212),
                padding: EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16.0), // Espaçamento interno
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Borda arredondada
                ),
              ),
              child: Text('TextButton'),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: BorderSide(color: Colors.red), // Cor da borda
                padding: EdgeInsets.all(16.0), // Espaçamento interno
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Borda arredondada
                ),
              ),
              child: Text('OutlinedButton'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange, // Cor do texto
                padding: EdgeInsets.all(16.0), // Espaçamento interno
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Borda arredondada
                ),
              ),
              icon: Icon(Icons.add), // Ícone à esquerda do texto
              label: Text('ElevatedButton com Ícone'),
            ),
          ],
        ),
      ),
    );
  }
}
