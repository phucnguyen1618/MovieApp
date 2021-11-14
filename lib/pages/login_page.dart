import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widgets/login_widget.dart';
import 'package:flutter_movie_app/utils.dart' as color;
import 'package:flutter_movie_app/widgets/signup_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Movie App',
                style: TextStyle(
                    color: color.Utils.secondColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                  labelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'SIGN UP',
                    ),
                    Tab(
                      text: 'LOG IN',
                    )
                  ],
                  controller: _tabController!),
            ),
            Card(
              shadowColor: Colors.grey,
              elevation: 5.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.all(8.0),
                height: 280,
                child: TabBarView(
                  children: [
                    SignUpWidget(),
                    LoginWidget(),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  width: 80,
                  height: 1,
                  color: Colors.grey,
                  child: SizedBox(),
                ),
                Text(
                  "or connect with",
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  width: 80,
                  height: 1,
                  color: Colors.grey,
                  child: SizedBox(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        "assets/images/facebook.png",
                      ),
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/twitter.png',
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/whatsapp.png",
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
