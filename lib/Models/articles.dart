import 'package:tech_blog/Constants/api_constant.dart';

class ArticlesModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? isFavorite;
  String? createdAt;

  ArticlesModel({
    this.id,
    this.title,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.isFavorite,
    this.createdAt,
  });
  // We create a map from json and first parameter is key that all in json are String and second are dynamic
  ArticlesModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    image = ApiConstant.hostDlUrl + element['image'];
    catId = element['cat_id'];
    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }
}
