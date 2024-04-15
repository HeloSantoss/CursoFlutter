import 'package:flutter/material.dart';
import 'View.dart'; // Import da página HomePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exemplo SqlLite",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Função para realizar o login
  void _login() {
    // Implementar a lógica de autenticação
    // Por exemplo, verificar se o email e senha correspondem a um registro no banco de dados
    String email = _emailController.text;
    String password = _passwordController.text;

    // Verificar se o email e senha correspondem a algum registro no banco de dados
    bool isAuthenticated = BancoDadosCrud.autenticarUsuario(email, password);

    if (isAuthenticated) {
      // Se autenticado com sucesso, navegar para a página principal
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Se a autenticação falhar, exibir uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Email ou senha incorretos. Por favor, tente novamente.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _login, // Chamar a função _login() quando o botão for pressionado
              child: Text('Entrar'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navegar para a página de cadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Não tem uma conta? Cadastre-se aqui'),
            ),
          ],
        ),
      ),
    );
  }
}
