part of 'news_bloc.dart';

abstract class NewsEvents extends Equatable{
  const NewsEvents();
}

class LoadNewsEvents extends NewsEvents{
  @override
  List<Object> get props => [];
}

class UpdateNewsEvents extends NewsEvents{
  @override
  List<Object> get props => [];
}