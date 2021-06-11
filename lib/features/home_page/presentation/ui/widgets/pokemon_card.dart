import 'package:flutter/material.dart';
import 'package:poke_api_app/core/styles/colors.dart';
import 'package:poke_api_app/features/search_pokemon/presentation/ui/pokemon_screen.dart';

class PokemonCard extends StatelessWidget {
  final name;
  const PokemonCard({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PokemonScreen(
              name: name,
            ),
          ),
        );
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: CustomColors.shadowColor.withOpacity(.05),
                blurRadius: 12,
                spreadRadius: 5)
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
