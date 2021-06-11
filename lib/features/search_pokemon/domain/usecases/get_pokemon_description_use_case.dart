import 'package:poke_api_app/core/usecases/description_use_case.dart';
import 'package:poke_api_app/features/search_pokemon/data/datasource/get_pokemon_description_remote_data_source.dart';
import 'package:poke_api_app/features/search_pokemon/data/repositories/get_pokemon_description_repository_impl.dart';
import 'package:poke_api_app/features/search_pokemon/domain/entities/description.dart';
import 'package:poke_api_app/features/search_pokemon/domain/repositories/get_pokemon_description_repository.dart';

class GetPokemonDescriptionUseCase implements DescriptionUseCase {
  final GetPokemonDescriptionRepository repository =
      GetPokemonDescriptionRespositoryImpl(
          GetPokemonDescriptionRemoteDataSourceImpl());

  @override
  Future<Description> call(pokemon) async {
    return await repository.getDescription(pokemon: pokemon);
  }
}
