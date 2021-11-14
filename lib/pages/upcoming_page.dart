import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_movie_app/widgets/movie_nowplaying_widget.dart';
import 'package:flutter_movie_app/widgets/movie_upcoming_widget.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.Utils.mainColor,
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: Column(
            children: const [
              MovieUpcomingWidget(),
              MovieNowPlayingWidget(),
            ],
          )
        ));
  }
}
