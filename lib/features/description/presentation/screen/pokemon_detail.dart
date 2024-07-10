import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/utils/color/type_color.dart';
import 'package:pokedex/core/utils/functions/image_url.dart';
import 'package:pokedex/custom_shape/poke_ball.dart';
import 'package:pokedex/features/description/domain/entity/evolution.dart';
import 'package:pokedex/features/description/domain/entity/pokemon_detail.dart';
import 'package:pokedex/features/description/domain/entity/type.dart';
import 'package:pokedex/features/description/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex/features/description/presentation/widget/about_page.dart';
import 'package:pokedex/features/description/presentation/widget/pokemon_description_header.dart';
import 'package:pokedex/features/description/presentation/widget/stats_page.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';
import 'package:pokedex/main.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    context
        .read<PokemonDetailBloc>()
        .add(PokemonDetailEvent.getPokemonDetails(widget.pokemon));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PokemonDescriptionHeader(pokemon: widget.pokemon),
            TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: PokemonTypeColor.getColorForType(
                  widget.pokemon.pokemonTypes.first.type.name),
              labelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
              unselectedLabelStyle: const TextStyle(color: Colors.black54),
              tabs: tab
                  .map(
                    (e) => Tab(
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
                buildWhen: (previous, current) {
                  return current.maybeWhen(
                      orElse: () => false, loaded: (_) => true);
                },
                builder: (context, state) => TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  dragStartBehavior: DragStartBehavior.down,
                  children: [
                    AboutPage(
                      pokemonDetail:
                          state.mapOrNull(loaded: (value) => value.pokemon),
                    ),
                    StatsPage(
                      pokemonStats: state.mapOrNull(
                          loaded: (value) => value.pokemon.stat),
                      pokemonType: state.maybeMap(
                        orElse: () => PokemonType(name: 'other', slot: 1),
                        loaded: (value) => value.pokemon.type.first,
                      ),
                    ),
                    EvolutionScreen(
                        pokemonDetail:
                            state.mapOrNull(loaded: (value) => value.pokemon)),
                    const Column(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EvolutionScreen extends StatelessWidget {
  const EvolutionScreen({super.key, this.pokemonDetail});
  final PokemonDetail? pokemonDetail;
  @override
  Widget build(BuildContext context) {
    final evolutions = pokemonDetail?.evolutionChain.evolutions;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Evolution',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          if (evolutions != null)
            for (var evolution in evolutions)
              EvolutionCard(evolution: evolution)
          else
            const Text('No Evolution Data Found')
        ],
      ),
    );
  }
}

class EvolutionCard extends StatelessWidget {
  const EvolutionCard({
    super.key,
    required this.evolution,
  });

  final Evolution evolution;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EvolutionImgWithName(
          imageUrl: getImageUrlById(evolution.pokemonId),
          name: evolution.pokemon,
        ),
        const Spacer(),
        Column(
          children: [
            const Icon(Icons.arrow_forward),
            Text(
              evolution.methods,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Spacer(),
        EvolutionImgWithName(
          imageUrl: getImageUrlById(evolution.nextEvolutionId),
          name: evolution.nextEvolution,
        ),
      ],
    );
  }
}

class EvolutionImgWithName extends StatelessWidget {
  const EvolutionImgWithName({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: PokeBallClipper(),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red.withOpacity(0.2),
              ),
            ),
            CachedNetworkImage(
                height: screenSize.width * 0.3, imageUrl: imageUrl),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
