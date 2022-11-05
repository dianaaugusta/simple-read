import 'package:bloc/bloc.dart';
import 'package:simple_read_v2/bloc/news_bloc.dart';
import 'package:simple_read_v2/bloc/news_search_events.dart';
import 'package:simple_read_v2/bloc/news_search_state.dart';
import 'package:simple_read_v2/config/api_repository.dart';
import 'package:stream_transform/stream_transform.dart';

const _duration = const Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class NewsSearchBloc extends Bloc<NewsSearchEvents, NewsSearchState> {
  NewsSearchBloc({required this.apiRepository})
      : super(NewsSearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  final ApiRepository apiRepository;

  void _onTextChanged(
    TextChanged event,
    Emitter<NewsSearchState> emit,
  ) async {
    final searchTerm = event.text;

    if (searchTerm.isEmpty) return emit(NewsSearchStateEmpty());

    emit(NewsSearchStateLoading());

    try {
      final results = await apiRepository.fetchNewsList(searchTerm);
      emit(NewsSearchStateSuccess(results));
    } catch (error) {
      emit(NewsSearchStateError('something went wrong'));
    }
  }
}