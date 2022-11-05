import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:simple_read_v2/config/news_model.dart';

abstract class NewsSearchState extends Equatable{
  const NewsSearchState();

  @override
  List<Object> get props => []; 
}

class NewsSearchStateEmpty extends NewsSearchState{}

class NewsSearchStateLoading extends NewsSearchState{}

class NewsSearchStateSuccess extends NewsSearchState{
  const NewsSearchStateSuccess(this.items);

  final NewsModel items;

  @override 
  List<Object> get props => [items];

  @override 
  String toString() => 'SearchStateSuccess { items: ${items} }';
}

class NewsSearchStateError extends NewsSearchState{
  const NewsSearchStateError(this.error);
  final String error;

  @override
  List<Object> get props => [error]; 
}