import 'package:flutter/material.dart';
import 'package:pokedex/features/description/domain/entity/pokemon_detail.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, this.pokemonDetail});
  final PokemonDetail? pokemonDetail;

  @override
  Widget build(BuildContext context) {
    final description = pokemonDetail?.species.flavorTexts.toSet() ?? {};
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                DetailValueAndData(
                    value: 'Species', data: pokemonDetail?.species.genere),
                DetailValueAndData(
                    value: 'Height', data: pokemonDetail?.height),
                DetailValueAndData(
                    value: 'Weight', data: pokemonDetail?.weight),
                DetailValueAndData(
                    value: 'Habitat', data: pokemonDetail?.species.habitat),
                DetailValueAndData(
                    value: 'GrowthRate',
                    data: pokemonDetail?.species.growthRate),
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
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                DetailValueAndData(
                    value: 'Egg Groups',
                    data: pokemonDetail?.species.eggGroups.join(', ') ?? ''),
                const SizedBox(height: 15),
                const Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: description.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8, right: 15),
                      height: 6,
                      width: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        description.elementAt(index),
                      ),
                    ),
                  ],
                ),
              );
            },
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
