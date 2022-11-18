class Accident{
  late String title;
  late String description;

  Accident({
    required this.title,
    required this.description
  });

  Accident.fromMap(Map<String, dynamic>? map) {
    title = map?['title'] ?? '';
    description = map?['description'] ?? '';
  }
}