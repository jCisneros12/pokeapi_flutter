import 'package:poke_api_app/features/search_pokemon/domain/entities/description.dart';

abstract class GetPokemonDescriptionRepository {
  Future<Description> getDescription({String pokemon});
}
