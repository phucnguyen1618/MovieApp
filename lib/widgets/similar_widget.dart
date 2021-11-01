import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/detail/movie/similar_list_bloc.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/pages/movie_detail_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SimilarWidget extends StatefulWidget {
  const SimilarWidget({Key? key, required this.idMovie}) : super(key: key);

  final int idMovie;

  @override
  _SimilarWidgetState createState() => _SimilarWidgetState();
}

class _SimilarWidgetState extends State<SimilarWidget> {

  @override
  void initState() {
    super.initState();
    similarBloc.getSimilarList(widget.idMovie);
  }

  @override
  void dispose() {
    super.dispose();
    similarBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MAYBE YOU SHOULD WATCH',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          StreamBuilder<MovieResponse>(
              stream: similarBloc.similarStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 260.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.movieList.length,
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
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10.0, right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                snapshot.data!.movieList[index].posterPath!
                                        .isEmpty
                                    ? Container(
                                        width: 120.0,
                                        height: 180.0,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.0)),
                                            color: color.Utils.firstColor),
                                        child: const Icon(Icons.error_outline),
                                      )
                                    : Container(
                                        width: 120.0,
                                        height: 180.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(2.0)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://image.tmdb.org/t/p/w200" +
                                                        snapshot
                                                            .data!
                                                            .movieList[index]
                                                            .posterPath.toString()))),
                                      ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5.0),
                                  width: 100,
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
                          ),
                        );
                      }),
                );
              }),
        ],
      ),
    );
  }
}
