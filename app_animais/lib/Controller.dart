import 'package:app_animais/Model.dart';

class AnimalController {
    //atributo
    List<Animal> _listAnimal = [];

    // get da lista
    List<Animal> get listarAnimais => _listAnimal;

    // adicional animal
    void adicionarAnimal(String especie,String urlFoto,String urlAudio){
        Animal novoAnimal = Animal(especie,urlFoto,urlAudio);
        _listAnimal.add(novoAnimal);
    }
}