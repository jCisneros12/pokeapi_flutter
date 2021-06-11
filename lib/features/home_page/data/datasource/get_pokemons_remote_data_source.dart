import 'dart:convert';

import 'package:poke_api_app/core/api.dart';
import 'package:http/http.dart' as http;
import 'package:poke_api_app/features/home_page/data/models/pokemons_model.dart';

abstract class GetPokemonRemoteDataSource {
  Future<PokemonsModel> getAllPokemons();
}

class GetPokemonRemoteDataSourceImpl implements GetPokemonRemoteDataSource {
  final http.Client client = new http.Client();
  //GetPokemonRemoteDataSourceImpl(this.client);

  @override
  Future<PokemonsModel> getAllPokemons() async {
    final Uri apiUrl = Uri.parse(API_URL + "pokemon");
    //try to get pokemon data from API
    final response = await client.get(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    //check the reques of API
    if (response.statusCode == 200) {
      return PokemonsModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
