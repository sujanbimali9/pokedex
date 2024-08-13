import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/filters/pokemon_filters.dart';
import 'package:pokedex/features/home/presentation/bloc/filter_cubit/filter_bloc_cubit.dart';
import 'package:pokedex/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex/features/home/presentation/widgets/custom_filter_chip.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                              isSelected:
                                  state.selectedFilterGenerations.contains(e),
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
                              isSelected: state.selectedFilterTypes.contains(e),
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
            context.read<HomeBloc>().add(FetchPokemonsByFilter(isNew: true));
            Navigator.of(context).pop();
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
