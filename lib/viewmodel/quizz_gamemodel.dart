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
        answers: ["Energia eólica", "Energia solar", "Energia hidrelétrica"],
        correctAnswer: "Energia hidrelétrica"),
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
    Question(
        question:
            "O gás natural pode ser utilizado em quais tipos de veículos?",
        answers: [
          "Apenas em caminhões",
          "Em carros, ônibus e caminhões",
          "Apenas em ônibus"
        ],
        correctAnswer: "Em carros, ônibus e caminhões"),
    Question(
        question: "O que significa eficiência energética",
        answers: [
          "Consumir mais energia",
          "Usar aparelhos de alto consumo",
          "Aproveitar melhor a energia e reduzir desperdício"
        ],
        correctAnswer: "Aproveitar melhor a energia e reduzir desperdício"),
    Question(
        question: "Qual desses hábitos ajuda a economizar energia em casa?",
        answers: [
          "Desligar os aparelhos da tomada quando não estiverem em uso",
          "Deixar luzes acesas em todos os cômodos",
          "Assistir TV o dia todo"
        ],
        correctAnswer:
            "Desligar os aparelhos da tomada quando não estiverem em uso"),
    Question(
        question: "O que são lâmpadas LED?",
        answers: [
          "Lâmpadas que consomem mais energia que as lâmpadas incandescentes",
          "Lâmpadas que consomem menos energia e duram mais",
          "Lâmpadas que funcionam com pilhas"
        ],
        correctAnswer: "Lâmpadas que consomem menos energia e duram mais"),
    Question(
        question:
            "Qual equipamento transforma a energia solar em energia elétrica?",
        answers: ["Painel solar", "Bateria", "Turbina eólica"],
        correctAnswer: "Painel solar"),
    Question(
        question:
            "Os municípios de Iranduba e Manacapuru são reconhecidos pela produção de telhas e tijolos. Qual é a matéria-prima utilizada na fabricação desses itens?",
        answers: ["Areia", "Argila", "Brita"],
        correctAnswer: "Argila"),
    Question(
        question:
            "A maior mina do Estado do Amazonas está localizada em Presidente Figueiredo. Qual minério é extraído nessa mina?",
        answers: [
          "Cassiterita (minério de estanho)",
          "Silvinita (minério de potássio)",
          "Ouro"
        ],
        correctAnswer: "Cassiterita (minério de estanho)"),
    Question(
        question:
            "Qual município do Amazonas é conhecido por suas reservas de silvinita (minério de potássio), com grande potencial para a indústria de fertilizantes?",
        answers: ["Autazes", "Manaus", "Tefé"],
        correctAnswer: "Autazes"),
    Question(
        question:
            "A exploração mineral no Amazonas enfrenta desafios significativos. Qual é um dos principais obstáculos à mineração na região?",
        answers: [
          "Logística",
          "Falta de interesse do governo",
          "Escassez de minérios valiosos"
        ],
        correctAnswer: "Logística"),
    Question(
        question: "O Rio Madeira é conhecido pela ocorrência de qual minério?",
        answers: ["Bauxita", "Areia", "Ouro"],
        correctAnswer: "Ouro")
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
