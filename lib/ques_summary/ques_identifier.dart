import 'package:flutter/material.dart';

class QuesIdentifier extends StatelessWidget {
  const QuesIdentifier({
    super.key,
    required this.isCorrectAns,
    required this.quesIndex,
  });

  final int quesIndex;
  final bool isCorrectAns;

  @override
  Widget build(BuildContext context) {
    final quesNumber = quesIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAns
            ? const Color.fromARGB(255, 250, 156, 184)
            : const Color.fromARGB(255, 254, 100, 146),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        quesNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
