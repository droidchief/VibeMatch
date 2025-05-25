import 'package:vibe_match/models/option_model.dart';

class QuestionModel {
  final String question;
  final String answer;
  final List<OptionModel> options;

  QuestionModel({required this.question, required this.answer, required this.options});
}

final QuestionModel question = QuestionModel(
  question: "What is your favorite time \nof the day?",
  answer: "“Mine is definitely the peace in the morning.”",
  options: [
    OptionModel(option: "A", description: "The peace in the early mornings"),
    OptionModel(option: "B", description: "The magical golden hours"),
    OptionModel(option: "C", description: "Wind-down time after dinners"),
    OptionModel(option: "D", description: "The serenity past midnight"),
  ],
);
