import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_read_v2/bloc/news_bloc.dart';
import 'package:simple_read_v2/config/news_model.dart';

class HomePage extends StatefulWidget {
  // NewsBloc
  // NewsModel
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsBloc _newsBloc = NewsBloc();

  @override
  void initState() {
    _newsBloc.add(LoadNewsEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teste noticias"),),
      body: _buildTopNewsList(),
    );
  }

  Widget _buildTopNewsList(){
    return Container(
      margin: EdgeInsets.all(10.0),
      child: BlocProvider(
          create: (_) => _newsBloc,
          child: BlocListener<NewsBloc, NewsState>(
            listener: (context, state){
              if (state is NewsErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(state.exception!),
                    )
                );
              }
            },
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state){
                if(state is NewsLoadingState){
                  return CircularProgressIndicator();
                }
                else if(state is NewsLoadedState){
                  return _buildIndividualCard(context, state.news);
                }
                return Text("404");
              },
            ),
          ),
      ),
    );
  }

  Widget _buildIndividualCard(BuildContext context, NewsModel model){
    return ListView.builder(
        itemCount: model.articles!.length,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.all(10.0),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text("Autor: ${model.articles![index].author}"),
                    Text("Titulo : ${model.articles![index].title}"),
                    Text("Fonte : ${model.articles![index].url}")
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
  
  




}
