import 'package:flutter/cupertino.dart';
import 'package:poke_api_app/core/use_case.dart';
import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';

class PokemonsController with ChangeNotifier {
  //list of pokemons to present in ui
  List<Pokemon> pokemons = [];
  //get use case reference
  final UseCase useCase;

  PokemonsController(this.useCase);

  Future<void> getAllPokemons() async {
    final res = await useCase.call();
    if (res != null) {
      pokemons = res;
      notifyListeners();
    }
    //pokemons = [Pokemon(name: "Lugia")];
    //pokemons.addAll(res);
  }
}
