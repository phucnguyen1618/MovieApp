import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/login_page.dart';
import 'package:flutter_movie_app/utils.dart' as color;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Utils.mainColor,
      appBar: AppBar(
        backgroundColor: color.Utils.mainColor,
        centerTitle: true,
        title: const Text(
          'PROFILE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Card(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: const SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                        size: 45,
                      ),
                    )),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NGUYỄN HOÀNG PHÚC',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Information Details',
                    style: TextStyle(
                      color: color.Utils.secondColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Country: Vietnamese',
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    padding: const EdgeInsets.only(top: 4.0),
                    child: const Text(
                      'Address: Ngo Duc Ke Street, Hong Son Ward, Vinh City',
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            height: 300,
            width: 300,
            alignment: Alignment.center,
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
