import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/detail/movie/image_bloc.dart';
import 'package:flutter_movie_app/data/api/api.dart';

class ImagesWidget extends StatefulWidget {
  const ImagesWidget({Key? key, required this.idMovie}) : super(key: key);

  final int idMovie;

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  @override
  void initState() {
    super.initState();

    imageBloc.getImages(widget.idMovie);
  }

  @override
  void dispose() {
    super.dispose();
    imageBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ImageResponse>(
        stream: imageBloc.imageStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.data!.imageList.isNotEmpty) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  height: 350.0,
                  child: GridView.builder(
                    itemCount: snapshot.data!.imageList.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        'https://image.tmdb.org/t/p/w200' +
                            snapshot.data!.imageList[index].imagePath,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0),
                  ),
                );
              }
          }
          return const Center(
            child: Text(
              'No image for this movies.',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
