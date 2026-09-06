import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/actress.dart';
import '../models/sort_order.dart';
import 'database_provider.dart';

part 'home_state_provider.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Actress> actresses,
    @Default(false) bool isLoading,
    @Default('') String searchQuery,
    int? minBust,
    @Default(SortOrder.birthDateDesc) SortOrder sortOrder,
    @Default(false) bool onlyFavorites,
  }) = _HomeState;
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  final Ref ref;

  HomeStateNotifier(this.ref) : super(HomeState()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(isLoading: true);
    
    final dbService = ref.read(databaseProvider);
    final results = await dbService.searchActresses(
      query: state.searchQuery,
      minBust: state.minBust,
      sortOrder: state.sortOrder,
      onlyFavorites: state.onlyFavorites,
    );

    state = state.copyWith(
      actresses: results,
      isLoading: false,
    );
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
    fetchData();
  }

  void updateMinBust(int? minBust) {
    state = state.copyWith(minBust: minBust);
    fetchData();
  }

  void updateSortOrder(SortOrder sortOrder) {
    state = state.copyWith(sortOrder: sortOrder);
    fetchData();
  }

  void updateOnlyFavorites(bool onlyFavorites) {
    state = state.copyWith(onlyFavorites: onlyFavorites);
    fetchData();
  }
}

final homeStateProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(ref);
});
