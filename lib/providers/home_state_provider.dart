import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/actress.dart';
import 'database_provider.dart';

class HomeState {
  final List<Actress> actresses;
  final bool isLoading;
  final String searchQuery;
  final int? minBust;
  final bool isBirthDateDesc;
  final bool onlyFavorites;

  HomeState({
    this.actresses = const [],
    this.isLoading = false,
    this.searchQuery = '',
    this.minBust,
    this.isBirthDateDesc = true,
    this.onlyFavorites = false,
  });

  HomeState copyWith({
    List<Actress>? actresses,
    bool? isLoading,
    String? searchQuery,
    int? minBust,
    bool? isBirthDateDesc,
    bool? onlyFavorites,
    bool clearMinBust = false, // To allow setting minBust to null
  }) {
    return HomeState(
      actresses: actresses ?? this.actresses,
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
      minBust: clearMinBust ? null : (minBust ?? this.minBust),
      isBirthDateDesc: isBirthDateDesc ?? this.isBirthDateDesc,
      onlyFavorites: onlyFavorites ?? this.onlyFavorites,
    );
  }
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
      isBirthDateDesc: state.isBirthDateDesc,
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
    state = state.copyWith(minBust: minBust, clearMinBust: minBust == null);
    fetchData();
  }

  void updateSortOrder(bool isBirthDateDesc) {
    state = state.copyWith(isBirthDateDesc: isBirthDateDesc);
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
