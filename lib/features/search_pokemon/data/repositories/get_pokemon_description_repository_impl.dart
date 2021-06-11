import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:poke_api_app/features/search_pokemon/data/datasource/get_pokemon_description_remote_data_source.dart';
import 'package:poke_api_app/features/search_pokemon/data/models/description_model.dart';
import 'package:poke_api_app/features/search_pokemon/domain/entities/description.dart';
import 'package:poke_api_app/features/search_pokemon/domain/repositories/get_pokemon_description_repository.dart';

class GetPokemonDescriptionRespositoryImpl
    implements GetPokemonDescriptionRepository {
  final GetPokemonDescriptionRemoteDataSource dataSource;

  GetPokemonDescriptionRespositoryImpl(this.dataSource);

  @override
  Future<Description> getDescription({String pokemon}) async {
    bool isConected = await DataConnectionChecker().hasConnection;

    if (isConected) {
      final res = await dataSource.getDescription(pokemon: pokemon);
      if (res != null)
        return Description(
          descriptions: _descriptionList(res.flavorTextEntries),
        );
      else
        return null;
    } else {
      return null;
    }
  }

  ///in this case only get trhee "descriptions" but can change the number of the results (ex: entries.legth)
  List<String> _descriptionList(List<FlavorTextEntries> entries) {
    List<String> description = [];
    for (var i = 0; i < 3; i++) {
      description.add(entries[i].flavorText);
    }
    return description;
  }
}
