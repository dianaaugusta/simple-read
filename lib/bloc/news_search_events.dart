import 'package:equatable/equatable.dart';

abstract class NewsSearchEvents extends Equatable {
  const NewsSearchEvents();
}

class TextChanged extends NewsSearchEvents {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}