import 'dart:math';

import 'package:flutter/material.dart';

class Games {
  static int scores = 0;

  static List<String> choices = ["Rock", "Paper", "Scissor"];
  static String? randomChoice() {
    Random random = new Random();
    int robotChoiceIndex = random.nextInt(3);
    return choices[robotChoiceIndex];
  }
}

class choice {
  String? type = "";
  static var play_rules = {
    "Rock": {
      "Rock": " It is a draw!!",
      "Paper": "You Loose!!",
      "Scissor": "You Win!!",
    },
    "Paper": {
      "Rock": " You Win!!",
      "Paper": "It is a draw!!",
      "Scissor": "You loose!!",
    },
    "Scissor": {
      "Rock": " You loose!!",
      "Paper": "You Win!!",
      "Scissor": "It is a draw!!",
    },
  };
  choice(this.type);
}
