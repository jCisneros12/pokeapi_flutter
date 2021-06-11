import 'dart:convert';

import 'package:poke_api_app/core/api.dart';
import 'package:poke_api_app/features/search_pokemon/data/models/description_model.dart';

import 'package:http/http.dart' as http;

abstract class GetPokemonDescriptionRemoteDataSource {
  Future<DescriptionModel> getDescription({String pokemon});
}

class GetPokemonDescriptionRemoteDataSourceImpl
    implements GetPokemonDescriptionRemoteDataSource {
  final http.Client client = new http.Client();

  @override
  Future<DescriptionModel> getDescription({String pokemon}) async {
    final Uri apiUrl = Uri.parse(API_URL + "pokemon-species/" + pokemon);
    final response = await client.get(apiUrl, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return DescriptionModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
