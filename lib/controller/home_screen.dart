import 'package:get/get.dart';
import 'package:tech_blog/Constants/api_constant.dart';
import 'package:tech_blog/Models/articles.dart';
import 'package:tech_blog/Models/podcasts.dart';
import 'package:tech_blog/Models/poster.dart';
import 'package:tech_blog/Models/tags.dart';
import 'package:tech_blog/services/dio_services.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticlesModel> topVisited = RxList();
  RxList<PodcastsModel> topPodcast = RxList();
  RxBool isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
    isLoading.value = true;
  }

  // This method will assign data in above variables and lists
  getHomeItems() async {
    var response = await DioServices().getData(ApiConstant.homeScreenApi);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisited.add(ArticlesModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcast.add(PodcastsModel.fromJson(element));
      });
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);

      isLoading.value = false;
    } else {
      throw Exception('Failed to load data, Code: ${response.statusCode}');
    }
  }
}
