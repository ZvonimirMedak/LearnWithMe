//
//  HomeWireframe.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 05.12.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeWireframe: BaseWireframe<HomeViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Home", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: HomeViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeInterface {
    func navigateToLearning(_ questionDifficulty: QuestionDifficulty) {
        navigationController?.pushWireframe(LearningWireframe(questionsDifficulty: questionDifficulty))
    }
}
