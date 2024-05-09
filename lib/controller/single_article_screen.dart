import 'package:get/get.dart';
import 'package:tech_blog/Constants/api_constant.dart';
import 'package:tech_blog/Models/articles.dart';
import 'package:tech_blog/services/dio_services.dart';

class SingleArticleController extends GetxController {
  Rx<ArticlesModel> article = ArticlesModel().obs;
  RxBool isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    getSingleItem();
    isLoading.value = true;
  }

  // This method will assign data in above variables and lists
  getSingleItem() async {
    var response = await DioServices().getData(ApiConstant.articleSingleApi);
    print(response.data);
    if (response.statusCode == 200) {
      article.value = ArticlesModel.fromJson(response.data['info']);
      isLoading.value = false;
    } else {
      throw Exception('Failed to load data, Code: ${response.statusCode}');
    }
  }
}
