import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/presentation/bloc/filter_cubit/filter_bloc_cubit.dart';
import 'package:pokedex/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex/features/home/presentation/widgets/pokemon_list.dart';
import 'package:pokedex/features/home/presentation/widgets/search_screen.dart';

final generation = [
  'All',
  'Generation I',
  'Generation II',
  'Generation III',
  'Generation IV',
  'Generation V',
  'Generation VI',
  'Generation VII',
  'Generation VIII',
];
const List<String> pokemonTypes = [
  'Normal',
  'Fire',
  'Water',
  'Grass',
  'Electric',
  'Ice',
  'Poison',
  'Ghost',
  'Ground',
  'Flying',
  'Bug',
  'Dark',
  'Steel',
  'Rock',
  'Fairy',
  'Dragon',
  'Fighting',
  'Psychic',
];

const List<String> status = [
  'Normal',
  'Mythical',
  'Legendary',
  'Evolution',
  'NoEvolution',
];

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
    context.read<HomeBloc>().add(FetchPokemons());
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
            _scrollController.position.maxScrollExtent * 0.8 &&
        _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
      context.read<HomeBloc>().add(FetchPokemons());
    }
  }

  showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      },
    );
  }

  Future<void> showFilter() async {
    showDialog(
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        return AlertDialog(
          title: const Text('Filter'),
          content: SizedBox(
            height: screenSize.height * 0.7,
            width: screenSize.width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Generation',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: generation
                        .map(
                          (e) => BlocBuilder<FilterCubit, FilterState>(
                            builder: (context, state) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CustomFilterChip(
                                  label: e,
                                  isSelected: state.selectedFilterGenerations
                                      .contains(e),
                                  onPressed: (value) {
                                    context
                                        .read<FilterCubit>()
                                        .selectFilterGenerations(value);
                                  },
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Types',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: pokemonTypes
                        .map(
                          (e) => BlocBuilder<FilterCubit, FilterState>(
                            builder: (context, state) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CustomFilterChip(
                                  label: e,
                                  isSelected:
                                      state.selectedFilterTypes.contains(e),
                                  onPressed: (value) {
                                    context
                                        .read<FilterCubit>()
                                        .selectFilterTypes(value);
                                  },
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Others',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: status
                        .map(
                          (e) => BlocBuilder<FilterCubit, FilterState>(
                            builder: (context, state) {
                              return Padding(
                                padding: const EdgeInsets.all(2),
                                child: CustomFilterChip(
                                  label: e,
                                  onPressed: (value) {
                                    context
                                        .read<FilterCubit>()
                                        .selectFilterStatus(value);
                                  },
                                  isSelected:
                                      state.selectedFilterStatus.contains(e),
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                context.read<FilterCubit>().enableFilter();
                context
                    .read<HomeBloc>()
                    .add(FetchPokemonsByFilter(isNew: true));
                Navigator.of(context).pop();
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () async {
                      showFilter();
                    },
                    icon: const Icon(Icons.filter_alt_outlined),
                  ),
                ],
              ),
              Expanded(
                child: BlocSelector<FilterCubit, FilterState, bool>(
                  selector: (state) {
                    return state.filterEnabled;
                  },
                  builder: (context, filterEnabled) {
                    return BlocConsumer<HomeBloc, HomeState>(
                      listener: (context, state) {
                        if (state.status.error) {
                          showSnackbar(state.error!);
                        }
                      },
                      builder: (context, state) {
                        if (state.status.initial || state.status.loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return PokemonLists(
                          pokemons: filterEnabled
                              ? state.filteredPokemons
                              : state.pokemons,
                          scrollController: _scrollController,
                          fetchingMore: state.status.fetchingMore,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip(
      {super.key,
      required this.isSelected,
      required this.label,
      this.selectedColor,
      required this.onPressed});
  final bool isSelected;
  final String label;
  final Color? selectedColor;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: isSelected ? selectedColor ?? Colors.blue : null,
          border: Border.all(
              color: isSelected ? selectedColor ?? Colors.blue : Colors.black)),
      child: InkWell(
        onTap: () => onPressed(label),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text(label),
        ),
      ),
    );
  }
}
