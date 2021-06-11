import 'package:poke_api_app/core/use_case.dart';
import 'package:poke_api_app/features/home_page/data/datasource/get_pokemons_local_data_source.dart';
import 'package:poke_api_app/features/home_page/data/datasource/get_pokemons_remote_data_source.dart';
import 'package:poke_api_app/features/home_page/data/repositories/get_pokemons_repository_impl.dart';
import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';
import 'package:poke_api_app/features/home_page/domain/repositories/pokemons_repository.dart';

class GetPokemonsUseCase implements UseCase {
  final GetPokemonsRepository repository = GetPokemonRepositoryImpl(
      new GetPokemonLocalDataSourceImpl(),
      new GetPokemonRemoteDataSourceImpl());

  @override
  Future<List<Pokemon>> call() async {
    return await repository.getPokemons();
  }
}
