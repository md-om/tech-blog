import 'package:get/get.dart';
import 'package:tech_blog/Constants/api_constant.dart';
import 'package:tech_blog/Models/articles.dart';
import 'package:tech_blog/services/dio_services.dart';

class ArticleScreenController extends GetxController {
  RxList<ArticlesModel> articleList = RxList();
  RxBool isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    getArticlesList();
    isLoading.value = true;
  }

  // This method will assign data in above variables and lists
  getArticlesList() async {
    // TODO Declare the user id in getData with ApiConstant.articleScreenApi + user ID
    var response = await DioServices().getData(ApiConstant.articleScreenApi);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticlesModel.fromJson(element));
      });
      isLoading.value = false;
    } else {
      throw Exception(
          'Failed to load data, Error Code: ${response.statusCode}');
    }
  }
}
