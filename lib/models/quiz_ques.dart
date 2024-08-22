class QuizQues {
  const QuizQues(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle(); //creats new list based on the old list
    return shuffledList;
  }
}
