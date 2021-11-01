import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/detail/movie/movie_detail_bloc.dart';
import 'package:flutter_movie_app/data/api/movie_detail_response.dart';
import 'package:flutter_movie_app/models/genres.dart';
import 'package:flutter_movie_app/pages/movies_genres_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_movie_app/widgets/casts_widget.dart';
import 'package:flutter_movie_app/widgets/movie_resources_widget.dart';
import 'package:flutter_movie_app/widgets/similar_widget.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key, required this.idMovie}) : super(key: key);

  final int idMovie;

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    detailMovieBloc.getMovieDetail(widget.idMovie);
  }

  @override
  void dispose() {
    super.dispose();
    detailMovieBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Utils.mainColor,
      body: StreamBuilder<MovieDetailResponse>(
          stream: detailMovieBloc.movieDetailStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original" +
                                            snapshot.data!.detail.backdropPath
                                                .toString()),
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
                              left: 12,
                              top: 24,
                              child: GestureDetector(
                                onTap: _back,
                                child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: const Icon(Icons.arrow_back,
                                        color: Colors.black)),
                              )),
                          Positioned(
                              bottom: 0.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                  colors: [
                                    Color(0xD2424242),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                )),
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.detail.title.length >=
                                                  30
                                              ? snapshot.data!.detail.title
                                                  .replaceRange(
                                                      20,
                                                      snapshot.data!.detail
                                                          .title.length,
                                                      "...")
                                              : snapshot.data!.detail.title,
                                          style: const TextStyle(
                                              height: 1.5,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data!.detail.voteAverage
                                                      .toString() +
                                                  "/10",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16.0,
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              snapshot.data!.detail.popularity
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Icon(
                                              Icons.show_chart,
                                              color: Color(0xFA53EA37),
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      margin:
                                          const EdgeInsets.only(right: 16.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.amber,
                                      ),
                                      child: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Positioned(
                            top: 24.0,
                            right: 10.0,
                            child: Row(
                              children: [
                                IconButton(
                                    iconSize: 30,
                                    onPressed: () {
                                      print("Star");
                                    },
                                    icon: const Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.grey,
                                    )),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                IconButton(
                                    iconSize: 30,
                                    onPressed: () {
                                      print("Comment");
                                    },
                                    icon: const Icon(
                                      Icons.comment,
                                      color: Colors.grey,
                                    )),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                IconButton(
                                    iconSize: 30,
                                    onPressed: () {
                                      print("Add to list");
                                    },
                                    icon: const Icon(
                                      Icons.playlist_add,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            snapshot.data!.detail.posterPath!.isNotEmpty
                                ? Container(
                                    width: 120.0,
                                    height: 180.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(2.0)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w200" +
                                                    snapshot
                                                        .data!.detail.posterPath
                                                        .toString()))),
                                  )
                                : Container(
                                    width: 120.0,
                                    height: 180.0,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0)),
                                        color: color.Utils.firstColor),
                                    child: const Icon(Icons.error_outline),
                                  ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20.0),
                              height: 220.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'FILM DETAILS',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: color.Utils.secondColor,
                                        fontSize: 16.0),
                                  ),
                                  Container(
                                    width: 180.0,
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      snapshot.data!.detail.originalTitle,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(children: [
                                      const Text(
                                        'Published: ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                      Text(
                                        snapshot.data!.detail.releaseDate,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(children: [
                                      const Text(
                                        'Time: ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                      Text(
                                        snapshot.data!.detail.runtime
                                                .toString() +
                                            " min",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(children: [
                                      const Text(
                                        'Likes: ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                      Text(
                                        snapshot.data!.detail.voteCount
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3.0,
                                      ),
                                      const Icon(
                                        Icons.thumb_up,
                                        color: Colors.white,
                                        size: 12.0,
                                      )
                                    ]),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text(
                          'CATEGORIES',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                      _buildGenresListInMovie(snapshot.data!.detail.genresList),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'OVERVIEW',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                      AnimatedCrossFade(
                          firstChild: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 8.0, right: 8.0),
                            child: Text(
                              snapshot.data!.detail.overview,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: color.Utils.secondColor,
                                  fontSize: 12.0),
                            ),
                          ),
                          secondChild: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 8.0, right: 8.0),
                            child: Text(
                              snapshot.data!.detail.overview,
                              style: const TextStyle(
                                  color: color.Utils.secondColor,
                                  fontSize: 12.0),
                            ),
                          ),
                          crossFadeState: _isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: kThemeAnimationDuration),
                      GestureDetector(
                        onTap: _expand,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(_isExpanded ? 'SHOW LESS' : 'SHOW MORE',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      CastsWidget(idMovie: widget.idMovie),
                      MovieResourcesWidget(idMovie: widget.idMovie),
                      SimilarWidget(idMovie: widget.idMovie),
                    ],
                  ),
                );
            }
          }),
    );
  }

  Widget _buildGenresListInMovie(List<Genres> genresList) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Wrap(
          spacing: 8.0,
          children: List.generate(genresList.length, (index) {
            return ChoiceChip(
                selectedColor: Colors.white,
                onSelected: (isSelected) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MoviesGenresPage(genres: genresList[index])));
                },
                labelStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                label: Text(genresList[index].name),
                selected: false);
          })),
    );
  }

  void _expand() {
    setState(() {
      _isExpanded ? _isExpanded = false : _isExpanded = true;
    });
  }

  void _back() {
    Navigator.pop(context);
  }
}
