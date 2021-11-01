import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/blocs/home/person_bloc.dart';
import 'package:flutter_movie_app/data/api/person_response.dart';
import 'package:flutter_movie_app/models/person.dart';
import 'package:flutter_movie_app/pages/person_detail_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_movie_app/widgets/show_error_widget.dart';

class TrendingPersonWidget extends StatefulWidget {
  const TrendingPersonWidget({Key? key}) : super(key: key);

  @override
  _TrendingPersonWidgetState createState() => _TrendingPersonWidgetState();
}

class _TrendingPersonWidgetState extends State<TrendingPersonWidget> {

  @override
  void initState() {
    super.initState();
    personBloc.getListPerson();
  }

  @override
  void dispose() {
    super.dispose();
    personBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PersonResponse>(
        stream: personBloc.personStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
              height: 140,
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: Text(
                      'TRENDING PERSON ON THIS WEEK',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  snapshot.hasError
                      ? ShowErrorWidget(message: snapshot.error.toString())
                      : _buildListPerson(snapshot.data!.personList)
                ],
              ));
        });
  }

  Widget _buildListPerson(List<Person> personList) {
    return SizedBox(
      height: 91,
      child: ListView.builder(
          itemCount: personList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                goToPersonPage(personList[index].id);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    personList[index].profile.isEmpty
                        ? Container(
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
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w200' +
                                            personList[index].profile),
                                    fit: BoxFit.cover)),
                          ),
                    Text(personList[index].name,
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold,
                            height: 1.4)),
                    Text(personList[index].knownForDepartment,
                        maxLines: 2,
                        style: const TextStyle(
                            color: color.Utils.secondColor,
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold,
                            height: 1.4)),
                  ],
                ),
              ),
            );
          }),
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
