//
//  Questions.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 05.12.2021..
//

import Foundation

struct QuestionDifficulty {
    let difficulty: Difficulty
    let questions: [QuestionModel]

    init(stringDifficulty: String, questions: Any) {
        self.difficulty = QuestionDifficulty.difficulty(fromString: stringDifficulty)
        self.questions = QuestionDifficulty.mapToQuestionModel(questions)
    }

    init(difficulty: Difficulty, questions: [QuestionModel]) {
        self.difficulty = difficulty
        self.questions = questions
    }
}

private extension QuestionDifficulty {
    static func difficulty(fromString difficulty: String) -> Difficulty {
        switch difficulty {
        case "easy":
            return .easy
        case "medium":
            return .medium
        default:
            return .hard
        }
    }

    static func mapToQuestionModel(_ questions: Any) -> [QuestionModel] {
        let array = questions as? [[String: Any]]
        var items: [QuestionModel] = []
        array?.forEach { dictionary in
            items.append(QuestionModel(text: dictionary["text"] as? String ?? "", answer: dictionary["answer"] as? String ?? ""))
        }
        return items
    }
}
