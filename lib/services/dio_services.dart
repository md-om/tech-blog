import 'package:dio/dio.dart';

class DioServices {
  // We define it as dynamic because we don't know what kind of data we recieve
  Future<dynamic> getData(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await (dio
        .get(url,
            options: Options(
              responseType: ResponseType.json,
              method: 'GET',
            ))
        .then((response) => response));
  }
}
