class EtibiLocationEntity {
  final int id;
  final String name;

  EtibiLocationEntity({required this.id, required this.name});

  factory EtibiLocationEntity.fromJson(Map<String, dynamic> json, String keyName) {
    return EtibiLocationEntity(
      id: json['id'] ?? 0,
      name: json[keyName] ?? '',
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is EtibiLocationEntity && id == other.id;
  @override
  int get hashCode => id.hashCode;
}

class EtibiHistoryEntity {
  final int id;
  final String date;
  final int yesCount;
  final int questionCount;

  EtibiHistoryEntity({
    required this.id, required this.date, required this.yesCount, required this.questionCount,
  });

  factory EtibiHistoryEntity.fromJson(Map<String, dynamic> json) {
    return EtibiHistoryEntity(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      yesCount: json['yes_count'] ?? 0,
      questionCount: json['question_count'] ?? 0,
    );
  }

  // Logika Risiko Lokal
  String get riskLevel {
    if (yesCount == 0) return 'Risiko Rendah';
    if (yesCount <= 2) return 'Risiko Sedang';
    return 'Risiko Tinggi';
  }
}

class EtibiAnswerEntity {
  final String question;
  final bool isYa;

  EtibiAnswerEntity({required this.question, required this.isYa});

  factory EtibiAnswerEntity.fromJson(Map<String, dynamic> json) {
    return EtibiAnswerEntity(
      question: json['question'] ?? '',
      isYa: (json['answer'] ?? '') == 'iya',
    );
  }
}

class EtibiDetailEntity {
  final int id;
  final String date;
  final int yesCount;
  final List<EtibiAnswerEntity> answers;

  EtibiDetailEntity({required this.id, required this.date, required this.yesCount, required this.answers});

  factory EtibiDetailEntity.fromJson(Map<String, dynamic> json) {
    final answersList = (json['questionnaire_answers'] as List?)?.map((e) => EtibiAnswerEntity.fromJson(e)).toList() ?? [];
    return EtibiDetailEntity(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      yesCount: json['yes_count'] ?? 0,
      answers: answersList,
    );
  }

  String get riskLevel {
    if (yesCount == 0) return 'Risiko Rendah';
    if (yesCount <= 2) return 'Risiko Sedang';
    return 'Risiko Tinggi';
  }
}