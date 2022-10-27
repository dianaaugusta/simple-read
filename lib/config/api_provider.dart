import 'package:dio/dio.dart';
import 'package:simple_read_v2/config/news_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://newsapi.org/v2/top-headlines?country=br&apiKey=756198cce06a48deaf62957efd081d2e';

  Future<NewsModel> fetchNews() async {
    try {
      Response response = await _dio.get(_url);
      return NewsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewsModel.withError("Data not found / Connection issue");
    }
  }
}