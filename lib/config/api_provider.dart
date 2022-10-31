import 'package:dio/dio.dart';
import 'package:simple_read_v2/config/news_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<NewsModel> fetchNews(String country) async {
    try {
      String url = 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=756198cce06a48deaf62957efd081d2e';
      Response response = await _dio.get(url);
      return NewsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewsModel.withError("Data not found / Connection issue");
    }
  }
}