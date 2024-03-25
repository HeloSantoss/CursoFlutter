// Barra de Progresso Dinâmica:
// Utilize a barra de progresso (LinearProgressIndicator ou CircularProgressIndicator) para
// indicar visualmente o progresso de uma tarefa.
// Atualize dinamicamente o valor da barra de progresso em resposta a eventos no
// aplicativo.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProgressBarExample(),
    );
  }
}

class ProgressBarExample extends StatefulWidget {
  @override
  _ProgressBarExampleState createState() => _ProgressBarExampleState();
}

class _ProgressBarExampleState extends State<ProgressBarExample> {
  double _progressValue = 0.0;

  void _startProgress() {
    // Simula uma tarefa que leva algum tempo para ser concluída
    setState(() {
      _progressValue = 0.0;
    });

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _progressValue = 0.2;
      });
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _progressValue = 0.4;
      });
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _progressValue = 0.6;
      });
    });

    Future.delayed(Duration(milliseconds: 700), () {
      setState(() {
        _progressValue = 0.8;
      });
    });

    Future.delayed(Duration(milliseconds: 900), () {
      setState(() {
        _progressValue = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de Progresso Dinâmica'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 247, 24, 217)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startProgress,
              child: Text('Iniciar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
