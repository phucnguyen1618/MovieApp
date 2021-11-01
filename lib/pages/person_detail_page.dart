import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/detail/person/person_detail_bloc.dart';
import 'package:flutter_movie_app/data/api/person_detail_response.dart';
import 'package:flutter_movie_app/utils.dart' as utils;
import 'package:flutter_movie_app/widgets/know_for_widget.dart';

class PersonDetailPage extends StatefulWidget {
  const PersonDetailPage({Key? key, required this.idPerson}) : super(key: key);

  final int idPerson;

  @override
  _PersonDetailPageState createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    personDetailBloc.getPersonDetail(widget.idPerson);
  }

  @override
  void dispose() {
    super.dispose();
    personDetailBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Utils.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'DETAILS',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
      body: StreamBuilder<PersonDetailResponse>(
          stream: personDetailBloc.personDetailStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            snapshot.data!.personDetail.profilePath!.isNotEmpty
                                ? Container(
                                    width: 120.0,
                                    height: 180.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(2.0)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w200" +
                                                    snapshot.data!.personDetail
                                                        .profilePath
                                                        .toString()))),
                                  )
                                : Container(
                                    width: 120.0,
                                    height: 180.0,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0)),
                                        color: utils.Utils.firstColor),
                                    child: const Icon(Icons.error_outline),
                                  ),
                            Container(
                              height: 180.0,
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180.0,
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Name: ',
                                          style: const TextStyle(
                                              color: utils.Utils.firstColor),
                                          children: [
                                            TextSpan(
                                              text: snapshot
                                                  .data!.personDetail.name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.0),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'Gender: ',
                                        style: const TextStyle(
                                            color: utils.Utils.firstColor),
                                        children: [
                                          TextSpan(
                                            text: utils.Utils
                                                .displayGenderForCast(snapshot
                                                .data!.personDetail.gender),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'Birthday: ',
                                        style: const TextStyle(
                                            color: utils.Utils.firstColor),
                                        children: [
                                          TextSpan(
                                            text: snapshot
                                                .data!.personDetail.birthday
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  SizedBox(
                                    width: 180.0,
                                    child: RichText(
                                      maxLines: 2,
                                      text: TextSpan(
                                          text: 'Place of birth: ',
                                          style: const TextStyle(
                                              color: utils.Utils.firstColor),
                                          children: [
                                            TextSpan(
                                              text: snapshot.data!.personDetail
                                                  .placeOfBirth
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.0),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'Popularity: ',
                                        style: const TextStyle(
                                            color: utils.Utils.firstColor),
                                        children: [
                                          TextSpan(
                                            text: snapshot
                                                .data!.personDetail.popularity
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'BIOGRAPHY',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                        AnimatedCrossFade(
                            firstChild: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 8.0, right: 8.0),
                              child: Text(
                                snapshot.data!.personDetail.biography
                                    .toString(),
                                maxLines: 5,
                                style: const TextStyle(
                                    color: utils.Utils.secondColor,
                                    fontSize: 12.0),
                              ),
                            ),
                            secondChild: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 8.0, right: 8.0),
                              child: Text(
                                snapshot.data!.personDetail.biography,
                                style: const TextStyle(
                                    color: utils.Utils.secondColor,
                                    fontSize: 12.0),
                              ),
                            ),
                            crossFadeState: isExpanded
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: kThemeAnimationDuration),
                        GestureDetector(
                          onTap: _expand,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                  isExpanded ? 'SHOW LESS' : 'SHOW MORE',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        KnowForWidget(idPerson: widget.idPerson),
                      ],
                    ),
                  ),
                );
            }
          }),
    );
  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }
}
