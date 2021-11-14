import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: false,
                        onChanged: (isChecked) {
                          print(isChecked);
                        }),
                    Text(
                      "Remember me",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
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
                "Log In",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
