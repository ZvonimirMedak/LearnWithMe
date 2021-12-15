//
//  Category.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 05.12.2021..
//

import Foundation

struct Category {
    let name: String
    let questionDifficulties: [QuestionDifficulty]

    init(name: String, dictionary: [String : Any]) {
        self.name = name
        self.questionDifficulties = Category.mapToQuestionDifficulty(dictionary)
    }
}

private extension Category {
    static func mapToQuestionDifficulty(_ dictionary: [String : Any]) -> [QuestionDifficulty] {
        var difficulties: [QuestionDifficulty] = []
        dictionary.keys.forEach { key in
            difficulties.append(QuestionDifficulty(stringDifficulty: key, questions: dictionary[key]))
        }
        return difficulties
    }
}
