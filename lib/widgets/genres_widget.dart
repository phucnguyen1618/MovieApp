import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/home/genres_list_bloc.dart';
import 'package:flutter_movie_app/blocs/home/movie_genres_bloc.dart';
import 'package:flutter_movie_app/data/api/genres_response.dart';
import 'package:flutter_movie_app/models/genres.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_movie_app/widgets/movie_genres_widget.dart';

class GenresListWidget extends StatefulWidget {
  const GenresListWidget({Key? key}) : super(key: key);

  @override
  _GenresListWidgetState createState() => _GenresListWidgetState();
}

class _GenresListWidgetState extends State<GenresListWidget> {
  @override
  void initState() {
    super.initState();

    genresBloc.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenresResponse>(
        stream: genresBloc.genresStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error.toString().isNotEmpty) {
              return Center(
                child: Text(
                  snapshot.data!.error.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            } else {
              return GenresWidget(genresList: snapshot.data!.genresList);
            }
          }
          return const SizedBox();
        });
  }
}

class GenresWidget extends StatefulWidget {
  const GenresWidget({required this.genresList, Key? key}) : super(key: key);

  final List<Genres> genresList;

  @override
  _GenresWidgetState createState() => _GenresWidgetState();
}

class _GenresWidgetState extends State<GenresWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: widget.genresList.length, vsync: this);
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        moviesByGenresBloc.drainStream();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _tabController!.dispose();
    moviesByGenresBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 307.0,
      child: DefaultTabController(
        child: Scaffold(
          backgroundColor: color.Utils.mainColor,
          appBar: PreferredSize(
              child: AppBar(
                backgroundColor: color.Utils.mainColor,
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: color.Utils.firstColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  unselectedLabelColor: color.Utils.secondColor,
                  labelColor: Colors.white,
                  isScrollable: true,
                  tabs: widget.genresList.map((Genres genres) {
                    return Container(
                      padding: const EdgeInsets.only(bottom: 15.0, top: 10.0),
                      child: Text(
                        genres.name.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ),
              ),
              preferredSize: const Size.fromHeight(50.0)),
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.genresList.map((Genres genres) {
              return MovieWithGenresWidget(idGenres: genres.id);
            }).toList(),
          ),
        ),
        length: widget.genresList.length,
      ),
    );
  }
}
