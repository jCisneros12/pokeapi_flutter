import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:poke_api_app/features/home_page/data/datasource/get_pokemons_local_data_source.dart';
import 'package:poke_api_app/features/home_page/data/datasource/get_pokemons_remote_data_source.dart';
import 'package:poke_api_app/features/home_page/data/datasource/insert_pokemons_local_data_source.dart';
import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';
import 'package:poke_api_app/features/home_page/domain/repositories/pokemons_repository.dart';

class GetPokemonRepositoryImpl extends GetPokemonsRepository {
  final GetPokemonLocalDataSource localDataSource;
  final GetPokemonRemoteDataSource remoteDataSource;

  GetPokemonRepositoryImpl(this.localDataSource, this.remoteDataSource);
  //for save pokemon list in local DB
  InsertPokemonLocalDataSource insertPokemonLocalDataSource =
      InsertPokemonLocalDataSourceImpl();

  @override
  Future<List<Pokemon>> getPokemons() async {
    List<Pokemon> pokemons = [];
    //check if device is coneccted to internet
    bool isConected = await DataConnectionChecker().hasConnection;

    if (isConected) {
      //get list of pokemon from remote API
      final res = await remoteDataSource.getAllPokemons();
      if (res != null) {
        for (var i = 0; i < res.results.length; i++) {
          //print("POKEMON: " + res.results[i].name);
          var pokemonRes = res.results[i];
          Pokemon pokemon = Pokemon(name: pokemonRes.name, order: i + 1);
          pokemons.add(pokemon);
        }
        insertPokemonLocalDataSource.insertPokemons(pokemons: pokemons);
        return pokemons;
      }
    } else {
      //get list of pokemons from local DB
      final res = await localDataSource.getPokemons();
      if (res != null) {
        for (var i = 0; i < res.length; i++) {
          //for (var pk in res) {
          pokemons.add(Pokemon(name: res[i].name));
        }
        print("POKEMONS LOCAL DB");
        return pokemons;
      }
    }
    return null;
  }
}
