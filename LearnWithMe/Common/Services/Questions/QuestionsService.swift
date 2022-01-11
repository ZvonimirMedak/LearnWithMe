//
//  QuestionsService.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 12.12.2021..
//

import Foundation

class QuestionsService: QuestionServiceable {

    // MARK: - Private properties -

    private var remainingQuestions: [QuestionModel]
    private var score: Score = Score(correct: 0, incorrect: 0)
    private var currentQuestion: Question? = nil

    // MARK: - Init -

    init(questions: QuestionDifficulty) {
        remainingQuestions = questions.questions
    }
}

// MARK: - Extension -

extension QuestionsService {

    // MARK: - Internal properties

    var nextQuestion: Question? {
        guard let randomQuestion = remainingQuestions.randomElement(),
              (currentQuestion?.number ?? 0) < 5
        else {
            return nil
        }
        currentQuestion = currentQuestion.isBlank ?
        Question(text: randomQuestion.text, answer: randomQuestion.answer, number: 1) :
        Question(text: randomQuestion.text, answer: randomQuestion.answer, number: currentQuestion!.number + 1)
        remainingQuestions.removeAll { $0 == randomQuestion }
        return currentQuestion
    }

    var result: String {
        switch score.correct {
        case 0:
            return "Very poor performance: 0/5"
        case 1:
            return "Poor performance: 1/5"
        case 2:
            return "You can do better: 2/5"
        case 3:
            return "You did well: 3/5"
        case 4:
            return "You did very well: 4/5"
        default:
            return "Excellent: 5/5"
        }
    }

    // MARK: - Internal functions -

    func save(_ answer: String) {
        guard let currentQuestion = currentQuestion else { return }
        answer.lowercased() == currentQuestion.answer.lowercased() ? score.answeredCorrectly() : score.answeredIncorrectly()
    }
}
