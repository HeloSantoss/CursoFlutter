import 'package:flutter/material.dart'; // Importação da biblioteca Flutter Material
import 'package:sqflite/sqflite.dart'; // Importação da biblioteca SQFLite para banco de dados
import 'package:path/path.dart'; // Importação da biblioteca path para manipulação de caminhos de arquivo

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Garante que os Widgets do Flutter estejam inicializados
  final database = openDatabase(
    // Abre o banco de dados SQLite
    join(await getDatabasesPath(),
        'contacts_database.db'), // Junta o caminho do diretório de banco de dados com o nome do banco de dados
    onCreate: (db, version) {
      // Função a ser executada na criação do banco de dados
      return db.execute(
        // Executa uma instrução SQL para criar a tabela de contatos
        'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, email TEXT)',
      );
    },
    version: 1, // Versão do banco de dados
  );
  runApp(MyApp(database: database)); // Inicializa o aplicativo Flutter
}

getDatabasesPath() {}

openDatabase(String join,
    {required Function(dynamic db, dynamic version) onCreate,
    required int version}) {}

class MyApp extends StatelessWidget {
  final Future<Database> database; // Futuro representando o banco de dados

  MyApp({required this.database}); // Construtor da classe MyApp

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SQLite Demo'), // Título da barra de aplicativos
        ),
        body: Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future:
                fetchContacts(), // Futuro para obter os contatos do banco de dados
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // Se os dados estiverem disponíveis
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: snapshot.data!.map((contact) {
                    // Mapeia os dados dos contatos para exibição
                    return ListTile(
                      title: Text(contact['name']), // Exibe o nome do contato
                      subtitle:
                          Text(contact['email']), // Exibe o email do contato
                    );
                  }).toList(),
                );
              } else if (snapshot.hasError) {
                // Se ocorrer um erro ao obter os dados
                return Text(
                    'Error: ${snapshot.error}'); // Exibe mensagem de erro
              }
              return CircularProgressIndicator(); // Exibe indicador de progresso enquanto os dados estão sendo carregados
            },
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchContacts() async {
    // Função para obter os contatos do banco de dados
    final Database db = await database; // Obtém o banco de dados
    final List<Map<String, dynamic>> contacts = await db
        .query('contacts'); // Executa uma consulta SQL para obter os contatos
    return contacts; // Retorna a lista de contatos
  }
}

class Database {
  query(String s) {}
}
