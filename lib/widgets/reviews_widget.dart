import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/detail/movie/reviews_bloc.dart';
import 'package:flutter_movie_app/data/api/reviews_response.dart';
import 'package:flutter_movie_app/utils.dart' as utils;

class ReviewsWidget extends StatefulWidget {
  const ReviewsWidget({Key? key, required this.idMovie}) : super(key: key);

  final int idMovie;

  @override
  _ReviewsWidgetState createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    reviewsBloc.getReviews(widget.idMovie);
  }

  @override
  void dispose() {
    super.dispose();
    reviewsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ReviewsResponse>(
        stream: reviewsBloc.reviewsStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                margin: const EdgeInsets.all(8.0),
                height: 400,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              return SizedBox(
                width: 450,
                child: ListView.builder(
                  itemCount: snapshot.data!.reviewList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 450,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.reviewList[index].author
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 3.0, bottom: 3.0),
                                child: Row(
                                  children: [
                                    Text(
                                      snapshot.data!.reviewList[index]
                                          .authorDetail!.username
                                          .toString(),
                                      style: const TextStyle(
                                          color: utils.Utils.firstColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Text(
                                      utils.Utils.formatDateTimeCreatedAt(
                                          snapshot
                                              .data!.reviewList[index].createAt
                                              .toString()),
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                              AnimatedCrossFade(
                                crossFadeState: _isExpanded
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                firstChild: SizedBox(
                                  width: 300,
                                  child: Text(
                                    snapshot.data!.reviewList[index].content,
                                    maxLines: 5,
                                    style: const TextStyle(
                                        color: utils.Utils.secondColor,
                                        fontSize: 12.0),
                                  ),
                                ),
                                secondChild: SizedBox(
                                  width: 300,
                                  child: Text(
                                    snapshot.data!.reviewList[index].content,
                                    style: const TextStyle(
                                        color: utils.Utils.secondColor,
                                        fontSize: 12.0),
                                  ),
                                ),
                                duration: kThemeAnimationDuration,
                              ),
                              GestureDetector(
                                onTap: _expand,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, right: 10.0),
                                    child: Text(
                                        _isExpanded ? 'VIEW LESS' : 'VIEW MORE',
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              );
          }
        });
  }

  void _expand() {
    setState(() {
      _isExpanded ? _isExpanded = false : _isExpanded = true;
    });
  }
}
