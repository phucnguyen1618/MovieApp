import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widgets/reviews_widget.dart';

import 'images_widget.dart';

class MovieResourcesWidget extends StatefulWidget {
  const MovieResourcesWidget({
    Key? key,
    required this.idMovie,
  }) : super(key: key);

  final int idMovie;

  @override
  _MovieResourcesWidgetState createState() => _MovieResourcesWidgetState();
}

class _MovieResourcesWidgetState extends State<MovieResourcesWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabController!.index,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: TabBar(tabs: const [
              Tab(
                text: 'REVIEWS',
              ),
              Tab(
                text: 'IMAGES',
              )
            ], controller: _tabController!),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(8.0),
            height: 400,
            child: TabBarView(
              children: [
                ReviewsWidget(
                  idMovie: widget.idMovie,
                ),
                ImagesWidget(
                  idMovie: widget.idMovie,
                ),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
