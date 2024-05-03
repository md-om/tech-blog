class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    required this.id,
    required this.title,
    required this.image,
  });
  // We create a map from json and first parameter is key that all in json are String and second are dynamic
  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    image = element['image'];
  }
}
