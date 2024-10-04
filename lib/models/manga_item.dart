class MangaItem {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final List<String> additionalImages;
  final String format;
  final String publisher;
  final String shortDescription;
  final String chapters; 
  bool isHovered = false;

  MangaItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.additionalImages,
    required this.format,
    required this.publisher,
    required this.shortDescription,
    required this.chapters, // Добавляем поле для глав
  });
}