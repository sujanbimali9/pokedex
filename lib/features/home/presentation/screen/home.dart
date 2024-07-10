import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/utils/color/type_color.dart';
import 'package:pokedex/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex/custom_shape/poke_ball.dart';
import 'package:pokedex/features/description/presentation/widget/pokemon_type_chip.dart';
import 'package:pokedex/features/description/presentation/screen/pokemon_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController(keepScrollOffset: true);
    context.read<HomeBloc>().add(const HomeEvent.fetchPokemons());
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<HomeBloc>().add(const HomeEvent.fetchPokemons());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 17.0),
              child: Text(
                'Pokedex',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return state.map(
                      initial: (_) =>
                          const Center(child: CircularProgressIndicator()),
                      loading: (_) =>
                          const Center(child: CircularProgressIndicator()),
                      loaded: (state) {
                        return PokemonLists(
                            state: state, scrollController: _scrollController);
                      },
                      error: (state) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                        return PokemonLists(
                            state: state, scrollController: _scrollController);
                      },
                      fetchingMore: (state) {
                        return PokemonLists(
                            state: state,
                            scrollController: _scrollController,
                            fetchingMore: true);
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonLists extends StatelessWidget {
  const PokemonLists({
    required this.state,
    super.key,
    required this.scrollController,
    this.fetchingMore = false,
  });
  final HomeState state;
  final ScrollController scrollController;
  final bool fetchingMore;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () {
        context
            .read<HomeBloc>()
            .add(const HomeEvent.fetchPokemons(limit: 20, offset: 0));
        return Future.delayed(const Duration(seconds: 2));
      },
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: state.pokemons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PokemonDetailScreen(
                        pokemon: state.pokemons[index],
                      )));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: PokemonTypeColor.getColorForType(
                    state.pokemons[index].pokemonTypes.first.type.name),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.pokemons[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        ...state.pokemons[index].pokemonTypes.map(
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
                        clipper: PokeBallClipper(),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.3)),
                          child: Container(),
                        ),
                      )),
                  Positioned(
                    right: 2,
                    bottom: 5,
                    child: CachedNetworkImage(
                      imageUrl: state.pokemons[index].imageUrl,
                      width: screenSize * 0.2,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
