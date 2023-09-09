import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterdesign/data/news_model.dart';
import 'package:masterdesign/repository/news_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  Repository repository;
  Map<int, String> categories = {
    0: 'business',
    1: 'entertainment',
    2: 'general',
    3: 'health',
    4: 'science',
    5: 'sports',
    6: 'technology'
  };

  int ind = 0;
  Map<int, dynamic> map = {};
  NewsBloc(this.repository) : super(NewsLoading()) {
    on<GetAllNews>((event, emit) async {
      ind = event.index;
      if (map.containsKey(ind)) {
        print("we have it ++++++++++++++++++++");
        List<NewsModel> news = map[ind];
        emit(NewsLoaded(news: news));
      } else if (!map.containsKey(ind)) {
        List<NewsModel> news =
            await repository.getNews(categories[ind].toString());
        map.addAll({ind: news});
        emit(NewsLoaded(news: news));
      }
    });
  }
}
