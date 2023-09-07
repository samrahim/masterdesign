part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoaded extends NewsState {
  final List<NewsModel> news;
  NewsLoaded({required this.news});
  @override
  List<Object?> get props => [news];
}
