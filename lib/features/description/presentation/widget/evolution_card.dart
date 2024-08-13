import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/functions/image_url.dart';
import 'package:pokedex/features/description/domain/entity/evolution.dart';
import 'package:pokedex/features/description/presentation/widget/evolution_img_name.dart';

class EvolutionCard extends StatelessWidget {
  const EvolutionCard({
    super.key,
    required this.evolution,
  });

  final Evolution evolution;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        EvolutionImgWithName(
          imageUrl: getImageUrlById(evolution.pokemonId),
          name: evolution.pokemon,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            children: [
              Text(
                evolution.trigger,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
              const Icon(Icons.arrow_forward),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                evolution.methods.join(', '),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
            ],
          ),
        ),
        EvolutionImgWithName(
          imageUrl: getImageUrlById(evolution.nextEvolutionId),
          name: evolution.nextEvolution,
        ),
      ],
    );
  }
}
