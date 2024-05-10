import 'package:app_carros/TelaDetalheCarros.dart';
import 'package:flutter/material.dart';
import 'package:my_app/controllers/carro_controller.dart'; // Importe o controlador necessário
import 'package:my_app/screens/tela_detalhe_carro.dart'; // Importe a tela de detalhes do carro

class TelaListaCarros extends StatelessWidget {
  final CarroController controllerCarros;

  TelaListaCarros(this.controllerCarros);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Meus Carros'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Lista de carros
          Expanded(
            child: ListView.builder(
              itemCount: controllerCarros.listarCarros.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // Exibe os carros listados no controller
                  title: Text(controllerCarros.listarCarros[index].modelo),
                  // Quando clicado, o carro abrirá a tela de descrição do carro
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaDetalheCarro(
                            controllerCarros.listarCarros[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
