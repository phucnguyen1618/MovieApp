import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/home/movies_popular_bloc.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/models/movie.dart';
import 'package:flutter_movie_app/pages/movie_detail_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_movie_app/widgets/show_error_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_indicator/page_indicator.dart';

import 'show_error_widget.dart';

class PopularListMoviesWidget extends StatefulWidget {
  const PopularListMoviesWidget({Key? key}) : super(key: key);

  @override
  _PopularListMoviesWidgetState createState() =>
      _PopularListMoviesWidgetState();
}

class _PopularListMoviesWidgetState extends State<PopularListMoviesWidget> {
  @override
  void initState() {
    super.initState();
    popularMoviesBloc.getMovies();
  }

  @override
  void dispose() {
    super.dispose();
    popularMoviesBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: StreamBuilder<MovieResponse>(
          stream: popularMoviesBloc.movieStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error.toString().isNotEmpty) {
                return ShowErrorWidget(
                  message: snapshot.data!.error.toString(),
                );
              } else {
                return PopularWidget(movieList: snapshot.data!.movieList);
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class PopularWidget extends StatefulWidget {
  const PopularWidget({required this.movieList, Key? key}) : super(key: key);

  final List<Movie> movieList;

  @override
  _PopularWidgetState createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: PageIndicatorContainer(
            align: IndicatorAlign.bottom,
            indicatorSpace: 8.0,
            padding: const EdgeInsets.all(5.0),
            indicatorColor: color.Utils.firstColor,
            indicatorSelectorColor: color.Utils.secondColor,
            shape: IndicatorShape.circle(size: 5.0),
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.movieList.take(5).length,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original" +
                                      widget.movieList[index].backdropPath.toString()),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            color.Utils.mainColor.withOpacity(1.0),
                            color.Utils.mainColor.withOpacity(0.0)
                          ],
                              stops: const [
                            0.0,
                            0.0
                          ])),
                    ),
                    Positioned(
                        bottom: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 250.0,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.movieList[index].title.length >= 30
                                            ? widget.movieList[index]
                                                .title
                                                .replaceRange(
                                                    25,
                                            widget.movieList[index]
                                                        .title
                                                        .length,
                                                    "...")
                                            : widget.movieList[index].title,
                                        style: const TextStyle(
                                            height: 1.5,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.movieList[index]
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
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 32.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(2.0)),
                                border:
                                    Border.all(color: Colors.white, width: 1.0),
                              ),
                              child: RaisedButton(
                                color: Colors.transparent,
                                onPressed: () {
                                  goToMovieDetailPage(widget.movieList[index]);
                                },
                                child: const Text(
                                  'WATCH',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )),
                  ]);
                }),
            length: widget.movieList.take(5).length));
  }

  void goToMovieDetailPage(Movie movie) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailPage(idMovie: movie.id,),
        ));
  }
}
