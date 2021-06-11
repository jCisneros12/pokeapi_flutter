import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';

abstract class GetPokemonByNameRepository {
  Future<Pokemon> getPokemonByName({String name});
}
