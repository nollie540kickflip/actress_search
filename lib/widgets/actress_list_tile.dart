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
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: actress.imageUrl != null
            ? NetworkImage(actress.imageUrl!)
            : null,
        child: actress.imageUrl == null ? const Icon(Icons.person) : null,
      ),
      title: Text(actress.name ?? '不明'),
      subtitle: Text(
        'バスト: ${actress.bust ?? '?'}cm / 生年月日: ${actress.birthDate != null ? "${actress.birthDate!.year}年" : "不明"}',
      ),
      trailing: IconButton(
        icon: Icon(
          actress.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: actress.isFavorite ? Colors.pink : null,
        ),
        onPressed: () async {
          final dbService = ref.read(databaseProvider);
          await dbService.toggleFavorite(actress.id, !actress.isFavorite);
          ref.read(homeStateProvider.notifier).fetchData();
        },
      ),
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
    );
  }
}
