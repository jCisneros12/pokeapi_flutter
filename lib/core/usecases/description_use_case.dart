import 'package:poke_api_app/features/search_pokemon/domain/entities/description.dart';

abstract class DescriptionUseCase {
  Future<Description> call(dynamic value);
}
