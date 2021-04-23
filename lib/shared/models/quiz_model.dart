import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:devquiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito"
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAwnsered;
  final Level level;
  final String imagem;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAwnsered = 0,
    required this.level,
    required this.imagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAwnsered': questionsAwnsered,
      'level': level.parse,
      'imagem': imagem,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAwnsered: map['questionsAwnsered'],
      level: map['level'].toString().parse,
      imagem: map['imagem'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel(title: $title, questions: $questions, questionsAwnsered: $questionsAwnsered, level: $level, imagem: $imagem)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is QuizModel &&
        other.title == title &&
        listEquals(other.questions, questions) &&
        other.questionsAwnsered == questionsAwnsered &&
        other.level == level &&
        other.imagem == imagem;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        questions.hashCode ^
        questionsAwnsered.hashCode ^
        level.hashCode ^
        imagem.hashCode;
  }
}
