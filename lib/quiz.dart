import 'package:flutter/material.dart';
import 'package:techwiz/data/ques.dart';
import 'package:techwiz/start_screen.dart';
import 'package:techwiz/ques_screen.dart';
import 'package:techwiz/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //underscore is for turning it into a private class
  List<String> selectedAns = [];
  var activeScreen = 'start-sreen';
  // Widget? activeScreen; //can also be null

  // @override
  // void initState() {
  //   //method provided by state class and is only executed once
  //   activeScreen = StartScreen(switchScreen);
  //   super
  //       .initState(); //makes sure that in the parent class/state class init state is executed as well to allow flutter to do its additional initialization work that ight be performed in that parent class
  // }

  void switchScreen() {
    setState(() {
      activeScreen =
          'questions-screen'; //const QuesScreen(); //ITS OKAY YOU CAN DO IT!
    });
  }

  void chooseAns(String ans) {
    selectedAns.add(ans);

    if (selectedAns.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  } //to store the selected ans

  void restartQuiz() {
    setState(() {
      selectedAns = [];
      activeScreen = 'ques_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuesScreen(
        onSelectAns: chooseAns,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAns,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 138, 173),
                Color.fromARGB(255, 255, 175, 166),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget, //activeScreen == 'start-screen'
          // ? StartScreen(switchScreen)
          //: const QuesScreen(), //Ternary Expression //activeScreen,
        ),
      ),
    );
  }
}
