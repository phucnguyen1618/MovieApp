import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/search_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_movie_app/widgets/genres_widget.dart';
import 'package:flutter_movie_app/widgets/popular_widget.dart';
import 'package:flutter_movie_app/widgets/toprated_widget.dart';
import 'package:flutter_movie_app/widgets/trending_person_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Utils.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('MOVIE APP'),
        actions: [
          IconButton(
              onPressed: () {
                goToSearchPage();
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PopularListMoviesWidget(),
            GenresListWidget(),
            TrendingPersonWidget(),
            TopRatedWidget(),
          ],
        ),
      ),
    );
  }

  void goToSearchPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SearchPage()));
  }
}
