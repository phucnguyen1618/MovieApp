import 'package:flutter/material.dart';
import 'package:flutter_movie_app/provider/search_movie_provider.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchMovieProvider(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: color.Utils.mainColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            _buildSearchBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: "Search any movies is here...",
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      onQueryChanged: (query) {
        context.read<SearchMovieProvider>().searchMovie(query);
      },
      transition: CircularFloatingSearchBarTransition(),
      builder: (BuildContext context, Animation<double> transition) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  children: context
                      .watch<SearchMovieProvider>()
                      .getResponse
                      .movieList
                      .map((item) => Text(
                            item.title,
                          ))
                      .toList(),
                )));
      },
    );
  }
}
