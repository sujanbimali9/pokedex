import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/utils/color/type_color.dart';
import 'package:pokedex/core/utils/functions/image_url.dart';
import 'package:pokedex/custom_shape/poke_ball.dart';
import 'package:pokedex/core/models/type.dart';
import 'package:pokedex/features/description/domain/entity/evolution.dart';
import 'package:pokedex/features/description/domain/entity/pokemon.dart';
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
    context.read<PokemonDetailBloc>().add(GetDetails(widget.pokemon));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(scrollbars: false),
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                    child: PokemonDescriptionHeader(pokemon: widget.pokemon)),
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: PersistanceTabBarDelegate(
                      tabBar: TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorColor: PokemonTypeColor.getColorForType(
                            widget.pokemon.pokemonTypes.first.name),
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        unselectedLabelStyle:
                            const TextStyle(color: Colors.black54),
                        tabs: tab
                            .map(
                              (e) => Tab(
                                child: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
              body: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
                buildWhen: (previous, current) {
                  if (current is PokemonDetailStateLoaded ||
                      current is PokemonDetailStateLoading) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) => TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    AboutPage(
                      pokemonDetail: (state is PokemonDetailStateLoaded)
                          ? state.pokemon
                          : null,
                    ),
                    StatsPage(
                        pokemonStats: (state is PokemonDetailStateLoaded)
                            ? state.pokemon.stats
                            : null,
                        pokemonType: (state is PokemonDetailStateLoaded)
                            ? state.pokemon.types.first
                            : PokemonType(name: 'other')),
                    EvolutionScreen(
                        pokemonDetail: (state is PokemonDetailStateLoaded)
                            ? state.pokemon
                            : null),
                    const Column(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PersistanceTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final double max;
  final double min;

  PersistanceTabBarDelegate({
    required this.tabBar,
    this.max = kTextTabBarHeight,
    this.min = kTextTabBarHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor, child: tabBar);
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class EvolutionScreen extends StatelessWidget {
  const EvolutionScreen({super.key, this.pokemonDetail});
  final PokemonDetail? pokemonDetail;
  @override
  Widget build(BuildContext context) {
    final evolutions = pokemonDetail?.evolutionChain?.evolutions;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomScrollView(
        slivers: [
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Text(
                  'Evolution',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                if (evolutions != null && evolutions.isNotEmpty)
                  for (var evolution in evolutions)
                    EvolutionCard(evolution: evolution)
                else
                  const Text('No Evolution Data Found')
              ],
            ),
          ),
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
                color: const Color.fromARGB(255, 75, 72, 72).withOpacity(0.2),
              ),
            ),
            CachedNetworkImage(
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
                height: screenSize.width * 0.3,
                imageUrl: imageUrl),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
