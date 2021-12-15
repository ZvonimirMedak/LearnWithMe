//
//  QuestionsServiceTests.swift
//  LearnWithMeTests
//
//  Created by Zvonimir Medak on 15.12.2021..
//

import Foundation
import XCTest
@testable import LearnWithMe

class QuestionsServiceTests: XCTestCase {

    var questionService: QuestionsService!
    override func setUpWithError() throws {
        questionService = QuestionsService(
            questions: QuestionDifficulty(difficulty: .easy, questions: [
            QuestionModel(text: "first question", answer: "answer"),
            QuestionModel(text: "second question", answer: "answer"),
            QuestionModel(text: "first question", answer: "answer")
            ]))
    }

    override func tearDownWithError() throws {
        questionService = nil
    }

    func testRemoveDuplicates() throws {
        _ = questionService.nextQuestion
        _ = questionService.nextQuestion
        XCTAssertNil(questionService.nextQuestion)
    }

    func testSave() throws {
        _ = questionService.nextQuestion
        questionService.save("answer")
        XCTAssertEqual(questionService.result, "Poor performance: 1/5")
    }
}
