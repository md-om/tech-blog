import 'package:get/get.dart';
import 'package:tech_blog/Constants/api_constant.dart';
import 'package:tech_blog/Models/articles.dart';
import 'package:tech_blog/Models/podcasts.dart';
import 'package:tech_blog/Models/poster.dart';
import 'package:tech_blog/services/dio_services.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;
  RxList tagsList = RxList();
  RxList<ArticlesModel> topVisited = RxList();
  RxList<PodcastsModel> topPodcast = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  // This method will assign data in above variables and lists
  getHomeItems() async {
    var response = await DioServices().getData(ApiConstant.homeScreenApi);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisited.add(ArticlesModel.fromJson(element));
      });
    } else {
      throw Exception('Failed to load data, Code: ${response.statusCode}');
    }
  }
}
