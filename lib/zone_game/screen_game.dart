import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rock_paper_scissor/welcome_screen.dart';
import 'package:rock_paper_scissor/zone_game/game.dart';
import 'package:rock_paper_scissor/widget/button.dart';
import "package:rock_paper_scissor/game_rules/rules.dart";

class GameScreens extends StatefulWidget {
  GameScreens(this.gameChoice, {Key? key}) : super(key: key);
  choice gameChoice;
  @override
  State<GameScreens> createState() => _GameScreensState();
}

class _GameScreensState extends State<GameScreens> {
  @override
  Widget build(BuildContext context) {
    double width_button = MediaQuery.of(context).size.width / 2 - 400;
    String? roboChoice = Games.randomChoice();
    String roboPath = "";
    switch (roboChoice) {
      case "Rock":
        roboPath = "assets/rock1.png";
        break;
      case "Paper":
        roboPath = "assets/paper1.png";
        break;
      case "Scissor":
        roboPath = "assets/scissor1.png";
        break;
      default:
    }

    String? playerChoice;
    switch (widget.gameChoice.type) {
      case "Rock":
        playerChoice = "assets/rock1.png";
        break;
      case "Paper":
        playerChoice = "assets/paper1.png";
        break;
      case "Scissor":
        playerChoice = "assets/scissor1.png";
        break;
      default:
    }

    if (choice.play_rules[widget.gameChoice.type]![roboChoice] == "You Win!!") {
      setState(() {
        Games.scores++;
      });
    }
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
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${Games.scores}",
                      style: TextStyle(
                        color: Colors.white,
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
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                        tag: "${widget.gameChoice.type}",
                        child: gameButton(null, playerChoice!, width_button)),
                    Text("VS",
                        style: TextStyle(
                          color: Colors.white70,
                        )),
                    gameButton(null, roboPath, width_button),
                  ],
                )),
              ),
              Text(
                "${choice.play_rules[widget.gameChoice.type]![roboChoice]}",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                  padding: EdgeInsets.all(16.0),
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.white70, width: 5.0)),
                  child: Text(
                    "Play Again",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GameRules()));
                  },
                  padding: EdgeInsets.all(16.0),
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.white70, width: 5.0)),
                  child: Text(
                    "Rules To Play",
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
