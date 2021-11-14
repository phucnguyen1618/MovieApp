import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/home/movies_toprated_bloc.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/models/movie.dart';
import 'package:flutter_movie_app/pages/movie_detail_page.dart';
import 'package:flutter_movie_app/utils.dart' as utils;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TopRatedWidget extends StatefulWidget {
  const TopRatedWidget({Key? key}) : super(key: key);

  @override
  _TopRatedWidgetState createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  @override
  void initState() {
    super.initState();
    topRatedBloc.getMovies();
  }

  @override
  void dispose() {
    super.dispose();
    topRatedBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
        stream: topRatedBloc.topRatedStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    'TOP RATED MOVIES',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                _buildListTopRatedMovies(
                  snapshot.data!.movieList,
                )
              ]);
        });
  }

  Widget _buildListTopRatedMovies(List<Movie> movies) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180.0,
      child: ListView.builder(
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                goToMovieDetailPage(movies[index]);
              },
              child: Row(
                children: [
                  Container(
                    width: 100.0,
                    height: 140.0,
                    margin: const EdgeInsets.only(
                        left: 8.0, right: 2.0, bottom: 8.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(2.0)),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w200" +
                                    movies[index].posterPath.toString()))),
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    alignment: Alignment.topRight,
                    height: 140.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            movies[index].title.length >= 25
                                ? movies[index].title.replaceRange(
                                    20, movies[index].title.length, "...")
                                : movies[index].title,
                            style: const TextStyle(
                              height: 1.4,
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            utils.Utils.formatDateTimeCreatedAt(movies[index].releaseDate.toString()),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14.0),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            'EVALUATE:',
                            style: TextStyle(
                                color: utils.Utils.secondColor, fontSize: 10.0),
                          ),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  movies[index].voteAverage.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  itemSize: 10.0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  movies[index].voteCount.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Icon(
                                  Icons.thumb_up,
                                  color: Colors.white,
                                  size: 10.0,
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'LANGUAGE:',
                              style: TextStyle(
                                  color: utils.Utils.secondColor,
                                  fontSize: 10.0),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              movies[index].originalLanguage.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  void goToMovieDetailPage(Movie movie) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailPage(
            idMovie: movie.id,
          ),
        ));
  }
}
