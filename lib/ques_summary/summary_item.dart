import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:techwiz/ques_summary/ques_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAns = itemData['userAns'] == itemData['correctAns'];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        QuesIdentifier(
          isCorrectAns: isCorrectAns,
          quesIndex: itemData['quesIndex'] as int,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['ques'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(itemData['userAns'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 246, 85, 165),
                  )),
              Text(itemData['correctAns'] as String,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 39, 104))),
            ],
          ),
        ),
      ]),
    );
  }
}
