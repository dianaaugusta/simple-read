import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_read_v2/bloc/news_bloc.dart';
import 'package:simple_read_v2/config/news_model.dart';
import 'package:simple_read_v2/screen/molecules/tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late NewsBloc _newsBloc = NewsBloc(country);

  static String country = "br";

  @override
  void initState() {
    super.initState();
    _newsBloc.add(LoadNewsEvents());
  }

  Future changeToDeutschNews() async {
    // ignore: avoid_print
    print("called");
    setState(() {
      _newsBloc.close();
      country = "de";
      _newsBloc = NewsBloc(country);
      _newsBloc.add(LoadNewsEvents());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          FloatingActionButton.small(onPressed: () async {
            await changeToDeutschNews();
          }),
          Expanded(
            child: SizedBox(
              height: 200.0,
              child: _buildTopNewsList(country),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopNewsList(country) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state is NewsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.exception),
              ));
            }
          },
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoadingState) {
                return CircularProgressIndicator();
              } else if (state is NewsLoadedState) {
                return _buildIndividualCard(context, state.news);
              }
              return Text("404");
            },
          ),
        ),
      ),
    );
  }

  Widget _buildIndividualCard(BuildContext context, NewsModel model) {
    return
        //FloatingActionButton(onPressed: changeToDeutschNews()),
        ListView.builder(
            itemCount: model.articles!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Image.network(
                                "${model.articles![index].urlToImage}"),
                            Text("Autor: ${model.articles![index].author}"),
                            Text("Teste: ${model.articles![index].title}")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            });
  }
}
