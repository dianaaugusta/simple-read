import 'package:simple_read_v2/config/api_provider.dart';

import 'news_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<NewsModel>fetchNewsList(){
    return _provider.fetchNews();
  }

}

class NetworkError extends Error{}