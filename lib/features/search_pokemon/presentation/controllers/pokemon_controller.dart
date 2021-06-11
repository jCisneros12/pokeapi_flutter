import 'package:flutter/cupertino.dart';
import 'package:poke_api_app/core/usecases/pokemon_use_case.dart';
import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';

class PokemonController with ChangeNotifier {
  Pokemon pokemon;

  final PokemonUseCase useCase;

  PokemonController(this.useCase);

  Future<void> getPokemonByName({String name}) async {
    final res = await useCase.call(name);
    if (res != null) {
      pokemon = res;
      notifyListeners();
    } else {
      pokemon = null;
    }
  }
}
