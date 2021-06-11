import 'package:poke_api_app/core/local_db/const.dart';
import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';
import 'package:poke_api_app/features/home_page/domain/entities/sprites.dart';
import 'package:poke_api_app/features/home_page/domain/entities/types.dart';

class PokemonModel extends Pokemon {
  String name;
  int order;
  Sprites sprites;
  List<Types> types;

  PokemonModel({
    this.name,
    this.order,
    this.sprites,
    this.types,
  }) : super(name: name, sprites: sprites, order: order, types: types);

  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    order = json['order'];
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;

    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
  }

  PokemonModel.fromMap(Map<String, dynamic> map) {
    name = map[POKEMON_NAME];
    //sprites = map[POKEMON_SPRITE];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
