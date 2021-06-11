import 'package:poke_api_app/core/usecases/pokemon_use_case.dart';
import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';
import 'package:poke_api_app/features/search_pokemon/data/datasource/get_pokemon_by_name_remote_data_source.dart';
import 'package:poke_api_app/features/search_pokemon/data/repositories/get_pokemon_by_name_repository_impl.dart';
import 'package:poke_api_app/features/search_pokemon/domain/repositories/get_pokemon_by_name_repository.dart';

class GetPokemonByNameUseCase implements PokemonUseCase {
  final GetPokemonByNameRepository repository =
      GetPokemonByNameRepositoryImpl(GetPokemonByNameRemoteDataSourceImpl());
  @override
  Future<Pokemon> call(dynamic name) async {
    return await repository.getPokemonByName(name: name);
  }
}
