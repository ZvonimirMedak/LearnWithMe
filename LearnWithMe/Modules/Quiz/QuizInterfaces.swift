//
//  QuizInterfaces.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 10.12.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import Combine
import CombineExt
protocol QuizWireframeInterface: WireframeInterface {
}

protocol QuizViewInterface: ViewInterface, Progressable {
}

protocol QuizPresenterInterface: PresenterInterface {
    func configure(with output: Quiz.ViewOutput) -> Quiz.ViewInput
}

protocol QuizInteractorInterface: InteractorInterface {
    var nextQuestion: Question? { get }
    func save(_ answer: String)
    var result: String { get }
}

enum Quiz {

    struct ViewOutput {
        let answer: Signal<String?>
        let next: AnyPublisher<Void, Never>
    }

    struct ViewInput {
        let configurator: Driver<QuizConfigurator>
    }

}
