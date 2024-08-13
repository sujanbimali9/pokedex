import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_bloc_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit()
      : super(const FilterState(
            filterEnabled: false,
            selectedFilterGenerations: ['All'],
            selectedFilterTypes: [],
            selectedFilterStatus: []));

  void selectFilterGenerations(String value) {
    final selectedFilterGenerations =
        List<String>.from(state.selectedFilterGenerations);
    if (value == 'All') {
      selectedFilterGenerations.clear();
      selectedFilterGenerations.add('All');
      emit(
          state.copyWith(selectedFilterGenerations: selectedFilterGenerations));
      return;
    }
    if (selectedFilterGenerations.contains(value)) {
      selectedFilterGenerations.remove(value);
    } else {
      selectedFilterGenerations.add(value);
    }
    if (selectedFilterGenerations.length > 1 &&
        selectedFilterGenerations.contains('All')) {
      selectedFilterGenerations.remove('All');
    }
    if (selectedFilterGenerations.isEmpty) {
      selectedFilterGenerations.add('All');
    }
    emit(state.copyWith(selectedFilterGenerations: selectedFilterGenerations));
  }

  void selectFilterTypes(String value) {
    final selectedFilterTypes = List<String>.from(state.selectedFilterTypes);
    if (selectedFilterTypes.contains(value)) {
      selectedFilterTypes.remove(value);
    } else {
      selectedFilterTypes.add(value);
    }
    emit(state.copyWith(selectedFilterTypes: selectedFilterTypes));
  }

  void selectFilterStatus(String value) {
    final selectedFilterStatus = List<String>.from(state.selectedFilterStatus);
    if (selectedFilterStatus.contains(value)) {
      selectedFilterStatus.remove(value);
    } else {
      selectedFilterStatus.add(value);
    }
    emit(state.copyWith(selectedFilterStatus: selectedFilterStatus));
  }

  void enableFilter() {
    if (state.selectedFilterGenerations.isNotEmpty ||
        state.selectedFilterStatus.isNotEmpty ||
        state.selectedFilterTypes.isNotEmpty) {
      emit(state.copyWith(filterEnabled: true));
    }
  }

  void removeFilter(String filter) {
    final selectedFilterGenerations =
        List<String>.from(state.selectedFilterGenerations);
    final selectedFilterTypes = List<String>.from(state.selectedFilterTypes);
    final selectedFilterStatus = List<String>.from(state.selectedFilterStatus);
    if (selectedFilterGenerations.contains(filter)) {
      selectedFilterGenerations.remove(filter);
    }
    if (selectedFilterTypes.contains(filter)) {
      selectedFilterTypes.remove(filter);
    }
    if (selectedFilterStatus.contains(filter)) {
      selectedFilterStatus.remove(filter);
    }
    emit(state.copyWith(
        selectedFilterGenerations: selectedFilterGenerations,
        selectedFilterTypes: selectedFilterTypes,
        selectedFilterStatus: selectedFilterStatus));
    if (selectedFilterGenerations.isEmpty &&
        selectedFilterTypes.isEmpty &&
        selectedFilterStatus.isEmpty) {
      emit(state.copyWith(filterEnabled: false));
    }
  }
}
