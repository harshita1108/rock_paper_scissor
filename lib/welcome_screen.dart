import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/zone_game/game.dart';
import 'package:rock_paper_scissor/widget/button.dart';
import 'package:rock_paper_scissor/zone_game/screen_game.dart';
import 'package:rock_paper_scissor/game_rules/rules.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width_button = MediaQuery.of(context).size.width / 2 - 400;

    return Scaffold(
        backgroundColor: Color(0xff060a47),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 34.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                      width: 5.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SCORES",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${Games.scores}",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: MediaQuery.of(context).size.width / 2 -
                              width_button / 2 -
                              20,
                          child: Hero(
                            tag: "Rock",
                            child: gameButton(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GameScreens(choice("Rock")),
                                  ));
                            }, "assets/rock1.png", width_button),
                          )),
                      Positioned(
                          top: width_button,
                          left: MediaQuery.of(context).size.width / 2 -
                              width_button -
                              40,
                          child: Hero(
                            tag: "Paper",
                            child: gameButton(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GameScreens(choice("Paper")),
                                  ));
                            }, "assets/paper1.png", width_button),
                          )),
                      Positioned(
                          top: width_button,
                          right: MediaQuery.of(context).size.width / 2 -
                              width_button -
                              40,
                          child: Hero(
                            tag: "Scissor",
                            child: gameButton(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GameScreens(choice("Scissor")),
                                  ));
                            }, "assets/scissor1.png", width_button),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(16.0),
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.white70, width: 5.0)),
                  child: Text(
                    "Click the images",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
