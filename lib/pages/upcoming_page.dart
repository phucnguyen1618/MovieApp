import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils.dart' as color;

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('UPCOMING'),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                      ],
                    ));
              }),
        ));
  }
}
