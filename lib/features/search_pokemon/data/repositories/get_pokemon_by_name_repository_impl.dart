import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';
import 'package:poke_api_app/features/search_pokemon/data/datasource/get_pokemon_by_name_remote_data_source.dart';
import 'package:poke_api_app/features/search_pokemon/domain/repositories/get_pokemon_by_name_repository.dart';

class GetPokemonByNameRepositoryImpl implements GetPokemonByNameRepository {
  final GetPokemonByNameRemoteDataSource dataSource;

  GetPokemonByNameRepositoryImpl(this.dataSource);

  @override
  Future<Pokemon> getPokemonByName({String name}) async {
    //check if device is coneccted to internet
    bool isConected = await DataConnectionChecker().hasConnection;

    if (isConected) {
      final res = await dataSource.getPokemon(name: name);
      if (res != null)
        return res;
      else
        return null;
    } else {
      return null;
    }
  }
}
