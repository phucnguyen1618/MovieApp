import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_movie_app/models/movie.dart';
import 'package:flutter_movie_app/pages/movie_detail_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movieList;

  const MovieListWidget({required this.movieList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movieList.isEmpty) {
      return const SizedBox(
        child: Text('No movies'),
      );
    } else {
      return SizedBox(
        height: 270.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailPage(
                          idMovie: movieList[index].id,
                        ),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      movieList[index].posterPath!.isEmpty
                          ? Container(
                              width: 120.0,
                              height: 180.0,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0)),
                                  color: color.Utils.firstColor),
                              child: const Icon(Icons.error_outline),
                            )
                          : Container(
                              width: 120.0,
                              height: 180.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w200" +
                                              movieList[index]
                                                  .posterPath
                                                  .toString()))),
                            ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        width: 100,
                        child: Text(
                          movieList[index].title,
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
                                movieList[index].voteAverage.toString(),
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
                                itemBuilder: (context, _) => const Icon(
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
                ),
              );
            }),
      );
    }
  }
}
