import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_read_v2/bloc/news_bloc.dart';
import 'package:simple_read_v2/config/news_model.dart';
import 'package:simple_read_v2/screen/molecules/tab_bar.dart';
import '../../bloc/news_observer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    Bloc.observer = NewsObserver();
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late NewsBloc _newsBloc = NewsBloc(country);
  static String country = "br";

  @override
  void initState() {
    _newsBloc.add(LoadNewsEvents());
    super.initState();
  }

  Future<void> changeToDeutschNews() async {
    country = "de";
    _newsBloc.emit(NewsLoadingState());
    _newsBloc.callNews(country);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FloatingActionButton.small(onPressed: () async {
              await changeToDeutschNews();
            }),
            BuildTopNewsList(bloc: _newsBloc),
          ],
        ),
      ),
    );
  }
}

class BuildTopNewsList extends StatelessWidget {
  final NewsBloc bloc;

  const BuildTopNewsList({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: BlocProvider(
        create: (_) => bloc,
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
                return BuildIndividualCard(model: state.news);
              }
              return Text("404");
            },
          ),
        ),
      ),
    );
  }
}

class BuildIndividualCard extends StatelessWidget {
  final NewsModel model;

  const BuildIndividualCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.articles!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        "${model.articles?[index].urlToImage}",
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('/atoms/error404.jpg');
                        },
                      ),
                      Text("Autor: ${model.articles?[index].author}"),
                      Text("Titulo: ${model.articles?[index].title}")
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
