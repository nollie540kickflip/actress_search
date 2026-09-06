import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_state_provider.dart';
import '../models/sort_order.dart';

class HomeFilters extends ConsumerStatefulWidget {
  const HomeFilters({super.key});

  @override
  ConsumerState<HomeFilters> createState() => _HomeFiltersState();
}

class _HomeFiltersState extends ConsumerState<HomeFilters> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TextEditingControllerを初期化時に同期する
    _searchController.text = ref.read(homeStateProvider).searchQuery;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeStateProvider);
    final notifier = ref.read(homeStateProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      child: Column(
        children: [
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(value: false, label: Text('すべて')),
              ButtonSegment(value: true, label: Text('お気に入り')),
            ],
            selected: {state.onlyFavorites},
            onSelectionChanged: (Set<bool> newSelection) {
              notifier.updateOnlyFavorites(newSelection.first);
            },
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: '名前で検索',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: state.searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        notifier.updateSearchQuery('');
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
            ),
            onChanged: (value) {
              notifier.updateSearchQuery(value);
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<int?>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: 'バスト絞り込み',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  initialValue: state.minBust,
                  items: const [
                    DropdownMenuItem(value: null, child: Text('指定なし')),
                    DropdownMenuItem(value: 80, child: Text('80cm以上')),
                    DropdownMenuItem(value: 90, child: Text('90cm以上')),
                    DropdownMenuItem(value: 100, child: Text('100cm以上')),
                  ],
                  onChanged: (value) {
                    notifier.updateMinBust(value);
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<SortOrder>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: '並び替え',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  initialValue: state.sortOrder,
                  items: const [
                    DropdownMenuItem(value: SortOrder.rubyAsc, child: Text('名前の五十音順')),
                    DropdownMenuItem(value: SortOrder.birthDateDesc, child: Text('生年月日が新しい順')),
                    DropdownMenuItem(value: SortOrder.birthDateAsc, child: Text('生年月日が古い順')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      notifier.updateSortOrder(value);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
