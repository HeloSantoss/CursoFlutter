import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaHome extends StatefulWidget {
  final String email;
  PaginaHome({required this.email});

  @override
  State<PaginaHome> createState() => _PaginaHomeState(email: email);
}

class _PaginaHomeState extends State<PaginaHome> {
  late SharedPreferences _prefs;
  bool _darkMode = false;
  String email;
  String _idioma = 'pt-br';

  final List<String> _treinos = [
    'Treino de Pernas',
    'Treino de Peito',
    'Treino de Costas',
    'Treino de Ombros',
    'Treino de Braços'
  ];

  late List<bool> _checkins;

  _PaginaHomeState({required this.email});

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = _prefs.getBool('${email}_darkMode') ?? false;
      _idioma = _prefs.getString('${email}_idioma') ?? 'pt-br';
      _checkins = _prefs
              .getStringList('${email}_checkins')
              ?.map((e) => e == 'true')
              .toList() ??
          List.filled(_treinos.length, false);
    });
  }

  Future<void> _mudarDarkMode() async {
    setState(() {
      _darkMode = !_darkMode;
    });
    await _prefs.setBool('${email}_darkMode', _darkMode);
  }

  Future<void> _mudarIdioma(String idioma) async {
    setState(() {
      _idioma = idioma;
    });
    await _prefs.setString('${email}_idioma', idioma);
  }

  void _toggleCheckin(int index) {
    setState(() {
      _checkins[index] = !_checkins[index];
    });
    _saveCheckins();
  }

  Future<void> _saveCheckins() async {
    await _prefs.setStringList(
        '${email}_checkins', _checkins.map((e) => e.toString()).toList());
  }

  List<String> _filtrarTreinos(bool checkados) {
    List<String> treinosFiltrados = [];
    for (int i = 0; i < _treinos.length; i++) {
      if (_checkins[i] == checkados) {
        treinosFiltrados.add(_treinos[i]);
      }
    }
    return treinosFiltrados;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(),
      duration: Duration(milliseconds: 500),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Armazenamento Interno'),
        ),
        body: Center(
          child: Column(
            children: [
              Switch(
                value: _darkMode,
                onChanged: (value) {
                  _mudarDarkMode();
                },
              ),
              Text("Selecione o Idioma"),
              DropdownButton<String>(
                value: _idioma,
                onChanged: (value) {
                  _mudarIdioma(value!);
                },
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'pt-br',
                    child: Text('Português (Brasil)'),
                  ),
                  DropdownMenuItem(
                    value: 'en-us',
                    child: Text('Inglês (EUA)'),
                  ),
                  DropdownMenuItem(
                    value: 'es-ar',
                    child: Text('Espanhol (Argentina)'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Treinos Marcados:"),
              Column(
                children: _filtrarTreinos(true).map((treino) {
                  return Text(treino);
                }).toList(),
              ),
              SizedBox(height: 20),
              Text("Treinos Não Marcados:"),
              Column(
                children: _filtrarTreinos(false).map((treino) {
                  return Text(treino);
                }).toList(),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _treinos.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(_treinos[index]),
                      value: _checkins[index],
                      onChanged: (checked) {
                        _toggleCheckin(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
