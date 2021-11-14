import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/upcoming/movie_nowplaying_bloc.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/pages/movie_detail_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieNowPlayingWidget extends StatefulWidget {
  const MovieNowPlayingWidget({Key? key}) : super(key: key);

  @override
  _MovieNowPlayingWidgetState createState() => _MovieNowPlayingWidgetState();
}

class _MovieNowPlayingWidgetState extends State<MovieNowPlayingWidget> {
  @override
  void initState() {
    super.initState();

    nowPlayingBloc.getNowPlayingMovie();
  }

  @override
  void dispose() {
    super.dispose();

    nowPlayingBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
        stream: nowPlayingBloc.nowPlayingStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 350.0,
                  child: const Center(child: CircularProgressIndicator()));
            case ConnectionState.active:
            case ConnectionState.done:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      'NOW PLAYING',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: 100.0,
                              height: 140.0,
                              margin: const EdgeInsets.only(
                                  left: 8.0, right: 2.0, bottom: 8.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w200" +
                                              snapshot.data!.movieList[index]
                                                  .posterPath
                                                  .toString()))),
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 130,
                              margin: const EdgeInsets.only(right: 8.0),
                              alignment: Alignment.topRight,
                              height: 150.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 6.0),
                                    child: Text(
                                      snapshot.data!.movieList[index].title
                                          .length >=
                                          30
                                          ? snapshot.data!.movieList[index]
                                          .title
                                          .replaceRange(
                                          25,
                                          snapshot.data!.movieList[index]
                                              .title.length,
                                          "...")
                                          : snapshot.data!.movieList[index]
                                          .title,
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
                                      snapshot.data!.movieList[index]
                                          .releaseDate
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14.0),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      'EVALUATE:',
                                      style: TextStyle(
                                          color: color.Utils.secondColor,
                                          fontSize: 10.0),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.movieList[index]
                                                .voteAverage
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0),
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
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            snapshot
                                                .data!.movieList[index]
                                                .voteCount
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0),
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
                                            color: color.Utils.secondColor,
                                            fontSize: 10.0),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        snapshot.data!.movieList[index]
                                            .originalLanguage
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0),
                                      )
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: RaisedButton(
                                      child: const Text(
                                        'WATCH NOW',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (
                                                context) => MovieDetailPage(
                                              idMovie: snapshot.data!
                                                  .movieList[index].id,)));
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  )
                ],
              );
          }
        });
  }
}
