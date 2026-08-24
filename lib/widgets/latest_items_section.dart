import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/dmm_item.dart';
import '../providers/api_provider.dart';
import '../services/api_exception.dart';

class LatestItemsSection extends ConsumerWidget {
  final int actressId;

  const LatestItemsSection({
    super.key,
    required this.actressId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiService = ref.read(apiProvider);
    
    return FutureBuilder<List<DmmItem>>(
      future: apiService.fetchLatestItems(actressId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          final error = snapshot.error;
          String errorMessage = '作品情報の取得に失敗しました';
          if (error is ApiException) {
            errorMessage = error.message;
          }
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        final items = snapshot.data;
        if (items == null || items.isEmpty) {
          return const SizedBox(
            height: 200,
            child: Center(child: Text('作品情報がありません')),
          );
        }

        return SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return DmmItemCard(item: item);
            },
          ),
        );
      },
    );
  }
}

class DmmItemCard extends StatelessWidget {
  final DmmItem item;

  const DmmItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (item.url != null) {
          final uri = Uri.parse(item.url!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        }
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: item.imageUrl != null
                  ? Image.network(
                      item.imageUrl!,
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 140,
                        width: 140,
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image),
                      ),
                    )
                  : Container(
                      height: 140,
                      width: 140,
                      color: Colors.grey[300],
                      child: const Icon(Icons.movie),
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (item.date != null) ...[
              const SizedBox(height: 4),
              Text(
                item.date!.split(' ')[0], // yyyy-MM-ddの部分だけ
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
