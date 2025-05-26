class MusicService {
  final String id;
  final String title;
  final String description;
  final String iconPath;
  final int order;

  MusicService({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.order,
  });

  factory MusicService.fromFirestore(String id, Map<String, dynamic> data) {
    return MusicService(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconPath: data['iconPath'] ?? '',
      order: data['order'] ?? 0,
    );
  }
}
