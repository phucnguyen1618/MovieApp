import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: Colors.black12,
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "First & Last name",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "Your username or email",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {
                print("Log In Success");
              },
              child: Text(
                "Create an Account",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
