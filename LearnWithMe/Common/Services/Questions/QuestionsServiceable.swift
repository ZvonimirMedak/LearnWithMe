//
//  QuestionsServiceable.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 12.12.2021..
//

import Foundation

protocol QuestionServiceable {
    func save(_ answer: String)
    var nextQuestion: Question? { get }
    var result: String { get }
}
