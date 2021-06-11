import 'package:flutter/cupertino.dart';
import 'package:poke_api_app/core/usecases/description_use_case.dart';
import 'package:poke_api_app/features/search_pokemon/domain/entities/description.dart';

class DescriptionController with ChangeNotifier {
  Description description;

  final DescriptionUseCase useCase;

  DescriptionController(this.useCase);

  Future<void> getPokemonDescription({String pokemon}) async {
    final res = await useCase.call(pokemon);
    if (res != null) {
      description = res;
      notifyListeners();
    } else {
      description = null;
    }
  }
}
