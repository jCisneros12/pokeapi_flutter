import 'dart:convert';

import 'package:poke_api_app/core/api.dart';
import 'package:poke_api_app/features/home_page/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class GetPokemonByNameRemoteDataSource {
  Future<PokemonModel> getPokemon({String name});
}

class GetPokemonByNameRemoteDataSourceImpl
    extends GetPokemonByNameRemoteDataSource {
  final http.Client client = new http.Client();

  @override
  Future<PokemonModel> getPokemon({String name}) async {
    final Uri apiUrl = Uri.parse(API_URL + "pokemon/" + name);
    final response = await client.get(apiUrl, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
