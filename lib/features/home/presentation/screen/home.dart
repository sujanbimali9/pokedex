import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/presentation/bloc/filter_cubit/filter_bloc_cubit.dart';
import 'package:pokedex/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex/features/home/presentation/widgets/filter_dialog.dart';
import 'package:pokedex/features/home/presentation/widgets/pokemon_list.dart';
import 'package:pokedex/features/home/presentation/screen/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  late Size screenSize;
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
      context
          .read<HomeBloc>()
          .add(FetchPokemons(limit: screenSize.width > 600 ? 40 : null));
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
        return const FilterDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
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
              BlocSelector<FilterCubit, FilterState, List<String>>(
                selector: (state) {
                  return [
                    ...state.selectedFilterGenerations,
                    ...state.selectedFilterTypes,
                    ...state.selectedFilterStatus
                  ];
                },
                builder: (context, state) {
                  if (state.contains('All')) {
                    return const SizedBox();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: state
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text(e),
                                  padding: const EdgeInsets.all(0),
                                  onDeleted: () {
                                    context.read<HomeBloc>().add(
                                        FetchPokemonsByFilter(isNew: true));

                                    context.read<FilterCubit>().removeFilter(e);
                                  },
                                ),
                              ),
                            )
                            .toList()),
                  );
                },
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
