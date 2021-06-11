import 'package:poke_api_app/core/local_db/const.dart';
import 'package:poke_api_app/core/local_db/database_helper.dart';
import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';
import 'package:sqflite/sqflite.dart';

abstract class InsertPokemonLocalDataSource {
  Future insertPokemons({List<Pokemon> pokemons});
}

class InsertPokemonLocalDataSourceImpl implements InsertPokemonLocalDataSource {
  final dbHelper = DataBaseHelper.instance;
  @override
  Future insertPokemons({List<Pokemon> pokemons}) async {
    final Database db = await dbHelper.database;
    Map<String, dynamic> pokemonMap = {};

    if (pokemons.length > 0) {
      for (var i = 0; i < pokemons.length; i++) {
        pokemonMap[POKEMON_ID] = pokemons[i].order;
        pokemonMap[POKEMON_NAME] = pokemons[i].name;
        db.insert(POKEMON_TABLE_NAME, pokemonMap,
            conflictAlgorithm: ConflictAlgorithm.replace);
        pokemonMap = {};
        //var res = await db.insert(POKEMON_TABLE_NAME, pokemonMap);
        //if (res == null) print("Ocurrió un problema al insertar los pokemons");
      }
    }
  }
}
