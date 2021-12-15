//
//  Progressable.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 07.12.2021..
//

import Foundation

public protocol Progressable: AnyObject {
    func showLoading()
    func hideLoading()

    func showLoading(blocking: Bool)
    func hideLoading(blocking: Bool)

    func showFailure(with error: Error)
    func showFailure(with title: String?, message: String?)
}
