import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';

class NowPlayingWidget extends StatefulWidget {
  const NowPlayingWidget({ Key? key }) : super(key: key);

  @override
  _NowPlayingWidgetState createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: null,
      builder: (context, snapshot) {
        return Container(
          
        );
      }
    );
  }
}