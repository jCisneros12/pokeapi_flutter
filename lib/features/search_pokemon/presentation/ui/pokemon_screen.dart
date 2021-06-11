import 'package:flutter/material.dart';
import 'package:poke_api_app/core/styles/colors.dart';
import 'package:poke_api_app/features/home_page/domain/entities/pokemon.dart';
import 'package:poke_api_app/features/search_pokemon/domain/entities/description.dart';
import 'package:poke_api_app/features/search_pokemon/domain/usecases/get_pokemon_by_name_use_case.dart';
import 'package:poke_api_app/features/search_pokemon/domain/usecases/get_pokemon_description_use_case.dart';
import 'package:poke_api_app/features/search_pokemon/presentation/controllers/description_controller.dart';
import 'package:poke_api_app/features/search_pokemon/presentation/controllers/pokemon_controller.dart';
import 'package:provider/provider.dart';

class PokemonScreen extends StatelessWidget {
  final String name;
  const PokemonScreen({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonController>(
          create: (_) => PokemonController(GetPokemonByNameUseCase())
            ..getPokemonByName(
              name: name.toLowerCase(),
            ),
        ),
        ChangeNotifierProvider(
          create: (_) => DescriptionController(GetPokemonDescriptionUseCase())
            ..getPokemonDescription(
              pokemon: name.toLowerCase(),
            ),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: CustomColors.blackSubTextColor,
          elevation: 1,
          title: Text(
            "Pokemon Details",
            style: TextStyle(color: CustomColors.blackSubTextColor),
          ),
          centerTitle: true,
        ),
        body: PokemonWidget(),
      ),
    );
  }
}

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);
    final pokemonDescription = Provider.of<DescriptionController>(context);
    Pokemon pokemon = pokemonController.pokemon;
    Description description = pokemonDescription.description;

    return pokemonController.pokemon != null
        ? Container(
            margin: EdgeInsets.all(25),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: Image.network(pokemonController
                          .pokemon.sprites.other.officialArtwork.frontDefault),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      pokemon.name.toUpperCase(),
                      style: TextStyle(
                        color: CustomColors.blackTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          pokemon.types.first.type.name,
                          style: TextStyle(
                            color: CustomColors.blackSubTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        pokemon.types.length > 1
                            ? Text(
                                " | " + pokemon.types[1].type.name,
                                style: TextStyle(
                                  color: CustomColors.blackSubTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                description != null
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  description.descriptions.first,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.blackSubTextColor,
                                  ),
                                ),
                                Text(
                                  description.descriptions[1],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.blackSubTextColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : CircularProgressIndicator(
                        backgroundColor: CustomColors.redColor,
                      ),
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(
                backgroundColor: CustomColors.redColor),
          );
  }
}
