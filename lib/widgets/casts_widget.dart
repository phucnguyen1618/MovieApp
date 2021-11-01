import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/detail/movie/cast_bloc.dart';
import 'package:flutter_movie_app/data/api/cast_response.dart';
import 'package:flutter_movie_app/pages/person_detail_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;

class CastsWidget extends StatefulWidget {
  const CastsWidget({Key? key, required this.idMovie}) : super(key: key);

  final int idMovie;

  @override
  _CastsWidgetState createState() => _CastsWidgetState();
}

class _CastsWidgetState extends State<CastsWidget> {
  @override
  void initState() {
    super.initState();

    castBloc.getCast(widget.idMovie);
  }

  @override
  void dispose() {
    super.dispose();

    castBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'CASTS',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ),
        StreamBuilder<CastResponse>(
            stream: castBloc.castStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  break;
              }
              return Container(
                margin: const EdgeInsets.all(8.0),
                height: 110.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.casts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          goToPersonPage(snapshot.data!.casts[index].id);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            snapshot.data!.casts[index].profilePath!.isEmpty
                                ? Container(
                                    margin: const EdgeInsets.all(8.0),
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: color.Utils.secondColor),
                                    child: const Icon(
                                      Icons.account_box_outlined,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.all(8.0),
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/w200' +
                                                    snapshot.data!.casts[index]
                                                        .profilePath
                                                        .toString()),
                                            fit: BoxFit.cover)),
                                  ),
                            Text(snapshot.data!.casts[index].name!.toString(),
                                maxLines: 2,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.4)),
                          ],
                        ),
                      );
                    }),
              );
            })
      ],
    );
  }

  void goToPersonPage(int id) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PersonDetailPage(
                  idPerson: id,
                )));
  }
}
