import 'package:flutter/material.dart';
import '../model/question.dart';

class QuizzViewModel extends ChangeNotifier {
  final List<Question> _questions = [
    Question(
      question:
          'Qual estado possui a maior reserva de gás natural em terra do Brasil?',
      answers: ['Amazonas', 'Pará', 'Rio de Janeiro'],
      correctAnswer: 'Amazonas',
    ),
    Question(
      question: 'Onde podemos encontrar gás natural?',
      answers: [
        'Apenas em áreas urbanas',
        'Apenas no fundo dos oceanos',
        'Em depósitos subterrâneos'
      ],
      correctAnswer: 'Em depósitos subterrâneos',
    ),
    Question(
        question:
            "Qual é a principal fonte de energia renovável utilizada para gerar eletricidade na maior parte do Brasil?",
        answers: [
          "Desligar os aparelhos da tomada quando não estiverem em uso",
          "Deixar luzes acesas em todos os cômodos",
          "Assistir TV o dia todo"
        ],
        correctAnswer:
            "Desligar os aparelhos da tomada quando não estiverem em uso"),
    Question(
        question:
            "Além de gás natural, o campo de Urucu também é conhecido pela produção de qual outro recurso?",
        answers: ["Minério de ferro", "Petróleo", "Gás de xisto"],
        correctAnswer: "Petróleo"),
    Question(
        question:
            "O gás natural pode ser utilizado para gerar qual tipo de energia?",
        answers: [
          "Apenas energia térmica",
          "Apenas energia elétrica",
          "Energia elétrica e térmica"
        ],
        correctAnswer: "Energia elétrica e térmica"),
  ];

  QuizzViewModel() {
    _initGame();
  }

  void _initGame() {
    _questions.shuffle();
    for (Question question in _questions) {
      question.answers.shuffle();
    }
    _currentQuestionIndex = 0;
    _isAnswerCorrect = null;
    notifyListeners();
  }

  int _currentQuestionIndex = 0;
  bool? _isAnswerCorrect;

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  bool? get isAnswerCorrect => _isAnswerCorrect;

  void checkAnswer(String answer) {
    _isAnswerCorrect =
        answer == _questions[_currentQuestionIndex].correctAnswer;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _isAnswerCorrect = null;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _isAnswerCorrect = null;
    notifyListeners();
  }
}
