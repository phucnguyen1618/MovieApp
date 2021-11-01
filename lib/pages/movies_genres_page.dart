import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/home/movie_genres_bloc.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/models/genres.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'movie_detail_page.dart';

class MoviesGenresPage extends StatefulWidget {
  const MoviesGenresPage({Key? key, required this.genres}) : super(key: key);

  final Genres genres;

  @override
  _MoviesGenresPageState createState() => _MoviesGenresPageState();
}

class _MoviesGenresPageState extends State<MoviesGenresPage> {
  @override
  void initState() {
    super.initState();

    moviesByGenresBloc.getMoviesByGenres(widget.genres.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Utils.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.genres.name.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<MovieResponse>(
          stream: moviesByGenresBloc.movieGenresStream,
          builder: (context, snapshot) {
            return Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: snapshot.data!.movieList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 10.0, childAspectRatio: 0.9),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailPage(
                                idMovie: snapshot.data!.movieList[index].id,
                              ),
                            ));
                      },
                      child: Stack(
                        children: [
                          snapshot.data!.movieList[index].posterPath!.isEmpty
                              ? Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 180.0,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.0)),
                                      color: color.Utils.firstColor),
                                  child: const Icon(Icons.error_outline),
                                )
                              : Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(2.0)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/w200" +
                                                  snapshot
                                                      .data!
                                                      .movieList[index]
                                                      .posterPath
                                                      .toString()), fit: BoxFit.fill)),
                                ),
                          Positioned(
                              left: 0.0,
                              bottom: 0.0,
                              child: Container(
                                padding: const EdgeInsets.all(3.0),
                                color: Colors.black38,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 160,
                                      child: Text(
                                        snapshot.data!.movieList[index].title,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            height: 1.4,
                                            color: Colors.white,
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data!.movieList[index]
                                                  .voteAverage
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            RatingBar.builder(
                                              initialRating: 3,
                                              itemSize: 10.0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
