import 'package:flutter/material.dart';
import 'package:poke_api_app/core/styles/colors.dart';
import 'package:poke_api_app/features/home_page/domain/usecases/get_pokemon_use_case.dart';
import 'package:poke_api_app/features/home_page/presentation/controllers/pokemons_controller.dart';
import 'package:poke_api_app/features/home_page/presentation/ui/widgets/pokemon_card.dart';
import 'package:poke_api_app/features/home_page/presentation/ui/widgets/search_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonsController>(
          create: (_) =>
              PokemonsController(GetPokemonsUseCase())..getAllPokemons(),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: widthSize,
                height: heightSize * .25,
                child: SearchContainer(),
              ),
              Container(
                height: heightSize * .75,
                child: _PokemonList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PokemonList extends StatefulWidget {
  const _PokemonList({Key key}) : super(key: key);

  @override
  __PokemonListState createState() => __PokemonListState();
}

class __PokemonListState extends State<_PokemonList> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PokemonsController>(context);
    final pokemons = controller.pokemons;
    return pokemons.length > 0
        ? Container(
            child: ListView.builder(
              itemCount: controller.pokemons.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  name: controller.pokemons[index].name,
                );
                //Text(.toString());
              },
            ),
          )
        : Container(
            child: Center(
                child: CircularProgressIndicator(
                    backgroundColor: CustomColors
                        .redColor) //Text("No se encontraron pokemones"),
                ),
          );
  }
}
