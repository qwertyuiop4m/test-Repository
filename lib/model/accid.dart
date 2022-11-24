//class Accident{
//  late String title;
//  late String description;

//  Accident({
//    required this.title,
//    required this.description
//  });

//  Accident.fromMap(Map<String, dynamic>? map) {
//    title = map?['title'] ?? '';
//    description = map?['description'] ?? '';
//  }
//}
class Accident{
  String? title;
  String? description;

  Accident({
    this.title,
    this.description
  });

  factory Accident.fromJson(Map<String, dynamic> jsonData){
    return Accident(
        title:jsonData['title'],
        description: jsonData['description']
    );
  }
}