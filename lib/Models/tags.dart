class TagsModel {
  String? id;
  String? title;

  TagsModel({
    required this.id,
    required this.title,
  });
  // We create a map from json and first parameter is key that all in json are String and second are dynamic
  TagsModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
  }
}
