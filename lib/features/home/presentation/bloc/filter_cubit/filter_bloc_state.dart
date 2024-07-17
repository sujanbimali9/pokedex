part of 'filter_bloc_cubit.dart';

@immutable
class FilterState {
  final bool filterEnabled;
  final List<String> selectedFilterGenerations;
  final List<String> selectedFilterTypes;
  final List<String> selectedFilterStatus;

  const FilterState({
    required this.filterEnabled,
    required this.selectedFilterGenerations,
    required this.selectedFilterTypes,
    required this.selectedFilterStatus,
  });

  FilterState copyWith({
    List<String>? selectedFilterGenerations,
    List<String>? selectedFilterTypes,
    List<String>? selectedFilterStatus,
    bool? filterEnabled,
  }) {
    return FilterState(
      filterEnabled: filterEnabled ?? this.filterEnabled,
      selectedFilterGenerations:
          selectedFilterGenerations ?? this.selectedFilterGenerations,
      selectedFilterTypes: selectedFilterTypes ?? this.selectedFilterTypes,
      selectedFilterStatus: selectedFilterStatus ?? this.selectedFilterStatus,
    );
  }
}
