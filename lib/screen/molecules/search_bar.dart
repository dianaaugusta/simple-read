import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_read_v2/bloc/news_search_events.dart';

import '../../bloc/news_search_bloc.dart';

class _SearchBar extends StatefulWidget {
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {

  final _textController = TextEditingController();
  late NewsSearchBloc _newsSearchBloc;

  
  @override
  void initState(){
    _newsSearchBloc = context.read<NewsSearchBloc>();
    super.initState();
  }

  @override
  void dispose(){
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      onChanged: (text){
        _newsSearchBloc.add(
          TextChanged(text: text)
        );
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: _onClearTapped,
          child: const Icon(Icons.clear),
        ),
        border: InputBorder.none,
        hintText: "Digite algo aqui...",
      ),
    );
  }

  void _onClearTapped(){
    _textController.text = "";
    _newsSearchBloc.add(const TextChanged(text: ""));
  }
}