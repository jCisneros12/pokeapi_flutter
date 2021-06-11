import 'package:flutter/material.dart';
import 'package:poke_api_app/core/styles/colors.dart';
import 'package:poke_api_app/features/search_pokemon/presentation/ui/pokemon_screen.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key key}) : super(key: key);

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      decoration: BoxDecoration(
        color: CustomColors.redColor,
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(45),
          bottomEnd: Radius.circular(45),
        ),
      ),
      child: Stack(children: [
        Positioned(
          right: 10,
          child: Image.asset("assets/images/pokeball_bg.png"),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "What Pokémon are you looking for?",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 250,
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: TextFormField(
                        controller: searchController,
                        maxLines: 1,
                        style: TextStyle(
                            color: CustomColors.blackSubTextColor,
                            fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Search by name",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)))),
                  ),
                  GestureDetector(
                    onTap: () {
                      //go to pokemon page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PokemonScreen(
                            name: searchController.text,
                          ),
                        ),
                      );
                      //print(searchController.text);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 65,
                      height: 45,
                      decoration: BoxDecoration(
                        color: CustomColors.blackColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
