import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_read_v2/bloc/news_search_bloc.dart';
import 'package:simple_read_v2/bloc/news_search_state.dart';

class _SearchBody extends StatelessWidget {
  const _SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsSearchBloc, NewsSearchState>(
      builder: (context, state) {
        if(state is NewsSearchStateLoading){
          return const CircularProgressIndicator();
        }
        if(state is NewsSearchStateError){
          return Text(state.error);
        }
        if(state is NewsSearchStateSuccess){
          return Expanded(
            
            )
        }
      },
    );
  }
}