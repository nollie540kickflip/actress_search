import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/actress.dart';
import 'package:intl/intl.dart';

import '../providers/database_provider.dart';
import '../widgets/info_row.dart';
import '../widgets/latest_items_section.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final Actress actress;

  const DetailScreen({super.key, required this.actress});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.actress.isFavorite;
  }

  void _toggleFavorite() async {
    final newState = !_isFavorite;
    final isarService = ref.read(databaseProvider);
    await isarService.toggleFavorite(widget.actress.id, newState);
    setState(() {
      _isFavorite = newState;
      widget.actress.isFavorite = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.actress.name ?? '詳細'),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.pink : null,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.actress.imageUrl != null)
              Image.network(
                widget.actress.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  height: 300,
                  child: Center(child: Icon(Icons.error, size: 50)),
                ),
              )
            else
              const SizedBox(
                height: 300,
                child: Center(child: Icon(Icons.person, size: 100, color: Colors.grey)),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.actress.name ?? '名前不明',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (widget.actress.ruby != null)
                    Text(
                      widget.actress.ruby!,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  const SizedBox(height: 16),
                  InfoRow(label: '生年月日', value: _formatDate(widget.actress.birthDate)),
                  const Divider(),
                  InfoRow(label: 'バスト', value: _formatSize(widget.actress.bust)),
                  const Divider(),
                  InfoRow(label: 'ウエスト', value: _formatSize(widget.actress.waist)),
                  const Divider(),
                  InfoRow(label: 'ヒップ', value: _formatSize(widget.actress.hip)),
                  const Divider(),
                  InfoRow(label: '身長', value: _formatSizeStr(widget.actress.height)),
                  const SizedBox(height: 32),
                  Text(
                    '最新の出演作品',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  if (widget.actress.dmmId != null)
                    LatestItemsSection(actressId: widget.actress.dmmId!)
                  else
                    const Text('作品情報がありません'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '不明';
    return DateFormat('yyyy年MM月dd日').format(date);
  }

  String _formatSize(int? size) {
    if (size == null) return '不明';
    return '${size}cm';
  }

  String _formatSizeStr(String? size) {
    if (size == null || size.isEmpty) return '不明';
    return '${size}cm';
  }
}
