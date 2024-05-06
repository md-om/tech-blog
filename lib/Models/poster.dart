import 'package:tech_blog/Constants/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });
  // We create a map from json and first parameter is key that all in json are String and second are dynamic
  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    image = ApiConstant.hostDlUrl + element['image'];
  }
}
