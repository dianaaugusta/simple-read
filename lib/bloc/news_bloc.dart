import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_read_v2/config/api_repository.dart';

import '../config/news_model.dart';

part 'news_events.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState>{
   String country;

  NewsBloc( this.country) : super(NewsLoadingState()){
    callNews(country);
  }

  Future<void> callNews(country) async{
    final ApiRepository _apiRepository = ApiRepository();
    on<LoadNewsEvents>((event, emit) async{
      try {
        emit(NewsLoadingState());
        final nList = await _apiRepository.fetchNewsList(country);
        emit(NewsLoadedState(nList));
        if(nList.error != null){
          emit(NewsErrorState(nList.error!));
        }
      } on NetworkError{
        emit(NewsErrorState("Falha em pegar as noticias. Confira conexao"));
      }
    });
  }
}
