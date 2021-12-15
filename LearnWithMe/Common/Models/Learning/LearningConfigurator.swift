//
//  LearningConfigurator.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 12.12.2021..
//

import Foundation

struct LearningConfigurator {
    let definition: String?
    let answer: String?
    let position: Position
}

enum Position {
    case first, middle, last
}
