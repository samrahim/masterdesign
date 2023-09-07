import 'package:masterdesign/data/news_model.dart';
import 'package:masterdesign/data/news_web_service.dart';

class Repository {
  WebService webService;
  Repository(this.webService);
  List<NewsModel> news = [];

  Future<List<NewsModel>> getNews(String category) async {
    Map mp = await webService.getMap(category);
    List body = mp['articles'];

    news = body.map((e) => NewsModel.fromJson(e)).toList();
    return news;
  }
}
