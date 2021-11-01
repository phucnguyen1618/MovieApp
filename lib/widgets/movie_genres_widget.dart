import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/home/movie_genres_bloc.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/widgets/movie_widget.dart';

import 'show_error_widget.dart';

class MovieWithGenresWidget extends StatefulWidget {
  const MovieWithGenresWidget({required this.idGenres, Key? key})
      : super(key: key);

  final int idGenres;

  @override
  _MovieWithGenresWidgetState createState() => _MovieWithGenresWidgetState();
}

class _MovieWithGenresWidgetState extends State<MovieWithGenresWidget> {
  @override
  void initState() {
    super.initState();

    moviesByGenresBloc.getMoviesByGenres(widget.idGenres);
  }

  @override
  void dispose() {
    super.dispose();
    moviesByGenresBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: StreamBuilder<MovieResponse>(
          stream: moviesByGenresBloc.movieGenresStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  if (snapshot.data!.error.toString().isNotEmpty) {
                    return ShowErrorWidget(
                      message: snapshot.data!.error.toString(),
                    );
                  } else {
                    return MovieListWidget(movieList: snapshot.data!.movieList);
                  }
                }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
