import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/utils/color/type_color.dart';
import 'package:pokedex/core/models/type.dart';
import 'package:pokedex/features/description/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex/features/description/presentation/widget/about_page.dart';
import 'package:pokedex/features/description/presentation/widget/pokemon_description_header.dart';
import 'package:pokedex/features/description/presentation/widget/stats_page.dart';
import 'package:pokedex/features/description/presentation/widget/tab_bar_deligate.dart';
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
      length: 3,
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
