//
//  Score.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 12.12.2021..
//

import Foundation

struct Score {
    var correct: Int
    var incorrect: Int
}

extension Score {

    mutating func answeredCorrectly() {
        correct += 1
    }

    mutating func answeredIncorrectly() {
        incorrect += 1
    }
}
