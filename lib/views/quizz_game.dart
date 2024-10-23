import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/quizz_gamemodel.dart';

class QuizzGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizzViewModel(),
      child: Consumer<QuizzViewModel>(
        builder: (context, viewModel, child) {
          final question = viewModel.questions[viewModel.currentQuestionIndex];

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  question.question,
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                  child: viewModel.isAnswerCorrect != null
                      ? Text(
                          viewModel.isAnswerCorrect! ? 'Correto!' : 'Errado!',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              backgroundColor: viewModel.isAnswerCorrect!
                                  ? Colors.green
                                  : Colors.red),
                        )
                      : null,
                ),
                ...question.answers.map((answer) {
                  return SizedBox(
                    width: 1000,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.checkAnswer(answer);
                          Future.delayed(Duration(seconds: 1), () {
                            viewModel.nextQuestion();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            answer,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
