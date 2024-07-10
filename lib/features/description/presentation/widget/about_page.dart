import 'package:flutter/material.dart';
import 'package:pokedex/features/description/domain/entity/pokemon_detail.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, this.pokemonDetail});
  final PokemonDetail? pokemonDetail;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          DetailValueAndData(
              value: 'Species', data: pokemonDetail?.species.genere),
          DetailValueAndData(value: 'Height', data: pokemonDetail?.height),
          DetailValueAndData(value: 'Weight', data: pokemonDetail?.weight),
          DetailValueAndData(
              value: 'Habitat', data: pokemonDetail?.species.habitat),
          DetailValueAndData(
              value: 'GrowthRate', data: pokemonDetail?.species.growthRate),
          DetailValueAndData(
              value: 'Abilities',
              data: pokemonDetail?.ability
                  .map((e) => e.isHidden ? '${e.name}(hidden)' : e.name)
                  .join(', ')),
          DetailValueAndData(
              value: 'Base Happiness',
              data: pokemonDetail?.species.baseHappiness),
          const SizedBox(height: 15),
          const Text(
            'Breeding',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                SizedBox(
                  width: screenSize.width * 0.25,
                  child: const Text(
                    'Egg Groups',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Text(
                  pokemonDetail?.species.eggGroups.join(', ') ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text(
            pokemonDetail?.species.flavorTexts.toSet().join().splitMapJoin(
                  '\n',
                  onMatch: (p0) {
                    return ' ';
                  },
                ) ??
                '',
          ),
        ],
      ),
    );
  }
}

class DetailValueAndData extends StatelessWidget {
  const DetailValueAndData({
    super.key,
    required this.value,
    this.data,
  });

  final String value;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.25,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
          Flexible(
            child: Text(
              maxLines: 2,
              data != null ? data.toString() : '',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
