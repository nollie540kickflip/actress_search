class DmmItem {
  final String contentId;
  final String title;
  final String? imageUrl;
  final String? date;
  final String? url;

  DmmItem({
    required this.contentId,
    required this.title,
    this.imageUrl,
    this.date,
    this.url,
  });

  factory DmmItem.fromJson(Map<String, dynamic> json) {
    String? imgUrl;
    if (json['imageURL'] != null) {
      final images = json['imageURL'] as Map<String, dynamic>;
      imgUrl = images['large'] ?? images['list'] ?? images['small'];
    }

    return DmmItem(
      contentId: json['content_id']?.toString() ?? '',
      title: json['title']?.toString() ?? 'タイトル不明',
      imageUrl: imgUrl,
      date: json['date']?.toString(),
      url: json['affiliateURL']?.toString() ?? json['URL']?.toString(),
    );
  }
}
