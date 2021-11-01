import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils.dart' as color;

class MyRatedPage extends StatefulWidget {
  const MyRatedPage({Key? key}) : super(key: key);

  @override
  _MyRatedPageState createState() => _MyRatedPageState();
}

class _MyRatedPageState extends State<MyRatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Utils.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('MY RATED'),
      ),
    );
  }
}
