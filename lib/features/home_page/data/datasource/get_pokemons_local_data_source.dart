import 'package:poke_api_app/core/local_db/const.dart';
import 'package:poke_api_app/core/local_db/database_helper.dart';
import 'package:poke_api_app/features/home_page/data/models/pokemon_model.dart';

import 'package:sqflite/sqflite.dart';

abstract class GetPokemonLocalDataSource {
  Future<List<PokemonModel>> getPokemons();
}

class GetPokemonLocalDataSourceImpl implements GetPokemonLocalDataSource {
  final dbHelper = DataBaseHelper.instance;
  //list of pokemons
  List<PokemonModel> pokemons = [];

  @override
  Future<List<PokemonModel>> getPokemons() async {
    final Database db = await dbHelper.database;

    final List<Map<String, dynamic>> res = await db.query(
      POKEMON_TABLE_NAME,
      columns: [
        POKEMON_NAME,
      ],
    );
    if (res.length > 0) {
      for (var i = 0; i < res.length; i++) {
        PokemonModel pk = PokemonModel.fromMap(res[i]);
        pokemons.add(pk);
      }
      return pokemons;
    }
    return null;
  }
}
