import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/upcoming/movie_upcoming_bloc.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/pages/movie_detail_page.dart';

class MovieUpcomingWidget extends StatefulWidget {
  const MovieUpcomingWidget({Key? key}) : super(key: key);

  @override
  _MovieUpcomingWidgetState createState() => _MovieUpcomingWidgetState();
}

class _MovieUpcomingWidgetState extends State<MovieUpcomingWidget> {
  @override
  void initState() {
    super.initState();

    upcomingBloc.getUpcomingMovie();
  }

  @override
  void dispose() {
    super.dispose();

    upcomingBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
        stream: upcomingBloc.getUpcomingStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 120.0,
                  child: const Center(child: CircularProgressIndicator()));
            case ConnectionState.active:
            case ConnectionState.done:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 42.0, bottom: 8.0),
                    child: Text(
                      'UPCOMING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    height: 120.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.all(8.0),
                            width: 300.0,
                            height: 120.0,
                            child: Row(
                              children: [
                                Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w200" +
                                                snapshot.data!.movieList[index]
                                                    .posterPath
                                                    .toString(),
                                          ),
                                          fit: BoxFit.fill),
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(left: 8.0),
                                  height: 180.0,
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          snapshot.data!.movieList[index].title,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(
                                          snapshot.data!.movieList[index]
                                              .releaseDate
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0),
                                        ),
                                      ),
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
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieDetailPage(
                                                          idMovie: snapshot
                                                              .data!
                                                              .movieList[index]
                                                              .id)));
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(top: 6.0),
                                          child: Text(
                                            'VIEW DETAILS',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 13.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              );
          }
        });
  }
}
