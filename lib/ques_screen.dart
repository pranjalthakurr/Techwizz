import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techwiz/ans_button.dart';
import 'package:techwiz/data/ques.dart';

class QuesScreen extends StatefulWidget {
  const QuesScreen({
    super.key,
    required this.onSelectAns,
  });

  final void Function(String ans) onSelectAns;

  @override
  State<QuesScreen> createState() {
    return _QuesScreenState();
  }
}

class _QuesScreenState extends State<QuesScreen> {
  var currentQuesIndex = 0;

  void ansQues(String selectedAns) {
    widget.onSelectAns(selectedAns);
    //currentQuesIndex = currentQuesIndex + 1;
    //currentQuesIndex += 1;
    setState(() {
      currentQuesIndex++; //increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final currentQues = questions[currentQuesIndex];
    return SizedBox(
      width: double.infinity, //be as wide as you can
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQues.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 251, 205, 205),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQues.getShuffledAnswers().map((answer) {
              //map does not change the original list but return a new list with new objets.
              //shuffle does changes the orginal list
              return AnsButton(
                ansText: answer,
                onTap: () {
                  ansQues(answer);
                },
              );
            }) //convert it into a widget '...' pulls them out of the list and added as individual comma separarted ans buttons
          ],
        ),
      ),
    );
  }
}
