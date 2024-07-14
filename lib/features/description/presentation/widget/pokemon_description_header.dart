import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/color/type_color.dart';
import 'package:pokedex/custom_shape/detail_screen_shape.dart';
import 'package:pokedex/custom_shape/poke_ball.dart';
import 'package:pokedex/features/description/presentation/widget/pokemon_type_chip.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';

class PokemonDescriptionHeader extends StatelessWidget {
  const PokemonDescriptionHeader({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipPath(
          clipper: DetailScreenClipper(),
          child: Container(
            height: screenSize.height * 0.45,
            color: PokemonTypeColor.getColorForType(
                pokemon.pokemonTypes.first.type.name),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: pokemon.pokemonTypes
                                .map(
                                  (e) => PokmonTypeChip(
                                    type: e,
                                    margin: const EdgeInsets.only(right: 10),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                      Text(
                        '#0${pokemon.id}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: ClipPath(
            clipper: PokeBallClipper(),
            child: Container(
              height: 150,
              width: 150,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ),
        Positioned(
          height: 25,
          width: 40,
          left: screenSize.width * 0.25,
          top: screenSize.height * 0.24,
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            children: List.generate(
              15,
              (value) => Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            child: Hero(
          tag: 'pokemon-${pokemon.id}',
          child: CachedNetworkImage(
            imageUrl: pokemon.imageUrl,
            height: (screenSize.width * 0.6).clamp(0, 300),
          ),
        )),
      ],
    );
  }
}
