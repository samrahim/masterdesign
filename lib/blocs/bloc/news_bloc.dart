import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterdesign/data/news_model.dart';
import 'package:masterdesign/repository/news_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  Repository repository;
  List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];
  int ind = 0;
  NewsBloc(this.repository) : super(NewsLoading()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetAllNews) {
        ind = event.index;
        List<NewsModel> news = await repository.getNews(categories[ind]);
        emit(NewsLoaded(news: news));
      }
    });
  }
}
