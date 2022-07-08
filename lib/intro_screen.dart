import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rock_paper_scissor/welcome_screen.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff060a47),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Text(
            "Rock Paper Scissor",
            style: TextStyle(
              color: Colors.pink,
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(height: 30.0, width: 20.0),
          Container(
            child: Text(
              "Game",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
            width: 30.0,
          ),
          Container(
            child: Center(
              child: ElevatedButton(
                child: const Text('Start Game'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
                  primary: Colors.pink,
                  textStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
