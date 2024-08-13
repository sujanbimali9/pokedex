import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pokedex/core/utils/color/type_color.dart';
import 'package:pokedex/features/description/presentation/screen/pokemon_detail.dart';
import 'package:pokedex/features/description/presentation/widget/pokemon_type_chip.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemons,
    required this.index,
    this.clipper,
  });

  final List<Pokemon> pokemons;
  final int index;
  final CustomClipper<Path>? clipper;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PokemonDetailScreen(
              pokemon: pokemons[index],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: PokemonTypeColor.getColorForType(
              pokemons[index].pokemonTypes.first.name),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    pokemons[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  ...pokemons[index].pokemonTypes.map(
                        (e) => PokmonTypeChip(
                          type: e,
                          margin: const EdgeInsets.only(top: 5),
                        ),
                      )
                ],
              ),
            ),
            Positioned(
              right: -5,
              bottom: -10,
              child: ClipPath(
                clipper: clipper,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3)),
                ),
              ),
            ),
            Positioned(
              right: 2,
              bottom: 5,
              child: Hero(
                tag: 'pokemon-${pokemons[index].id}',
                child: CachedNetworkImage(
                  imageUrl: pokemons[index].imageUrl,
                  width: (width * 0.2).clamp(50, 140),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
