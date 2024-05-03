class PodcastsModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastsModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });
  // We create a map from json and first parameter is key that all in json are String and second are dynamic
  PodcastsModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    poster = element['poster'];
    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }
}
