part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {}

// ignore: must_be_immutable
class GetAllNews extends NewsEvent {
  int index;
  GetAllNews(this.index);
  @override
  List<Object?> get props => [index];
}
