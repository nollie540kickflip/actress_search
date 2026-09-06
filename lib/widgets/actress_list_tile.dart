import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/actress.dart';
import '../providers/database_provider.dart';
import '../providers/home_state_provider.dart';
import '../screens/detail_screen.dart';

class ActressListTile extends ConsumerWidget {
  final Actress actress;

  const ActressListTile({
    super.key,
    required this.actress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(actress: actress),
            ),
          );
          // 戻ってきたらお気に入り状態が変わっているかもしれないので再取得
          ref.read(homeStateProvider.notifier).fetchData();
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Hero(
                tag: 'actress_image_${actress.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: actress.imageUrl != null
                      ? Image.network(
                          actress.imageUrl!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => _buildPlaceholder(context),
                        )
                      : _buildPlaceholder(context),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      actress.name ?? '不明',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'バスト: ${actress.bust ?? '?'}cm / 生年: ${actress.birthDate != null ? actress.birthDate!.year : "不明"}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  actress.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: actress.isFavorite ? Theme.of(context).colorScheme.primary : null,
                ),
                onPressed: () async {
                  final dbService = ref.read(databaseProvider);
                  await dbService.toggleFavorite(actress.id, !actress.isFavorite);
                  ref.read(homeStateProvider.notifier).fetchData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Icon(Icons.person, size: 40, color: Colors.grey),
    );
  }
}
