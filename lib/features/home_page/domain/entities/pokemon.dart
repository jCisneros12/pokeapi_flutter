import 'package:poke_api_app/features/home_page/domain/entities/sprites.dart';
import 'package:poke_api_app/features/home_page/domain/entities/types.dart';

class Pokemon {
  final String name;
  int order;
  final Sprites sprites;
  final List<Types> types;

  Pokemon({
    this.sprites,
    this.name,
    this.types,
    this.order,
  });
}
