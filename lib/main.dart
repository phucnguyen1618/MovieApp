import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/container_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContainerPage(),
    );
  }
}

