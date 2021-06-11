import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';

abstract class GetPokemonsRepository {
  Future<List<Pokemon>> getPokemons();
}
