//
//  KeyboardHandler.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 12.12.2021..
//

import UIKit
import Combine
import CombineCocoa

enum KeyboardHandler {

    struct PresentingParams: Equatable {
        let keyboardSize: CGSize
        let animationDuration: Double
        let state: State

        enum State {
            case show
            case hide
        }
    }

    enum Insets {
        case forShown(inset: CGFloat)
        case forHidden(inset: CGFloat)
        case always(inset: CGFloat)
        case never

        func add(to value: CGFloat, with state: PresentingParams.State) -> CGFloat {
            switch (self, state) {
            case (.always(let inset), _):
                return value + inset
            case (.forShown(let inset), .show):
                return value + inset
            case (.forHidden(let inset), .hide):
                return value + inset
            default:
                return value
            }
        }
    }
}

// MARK: - Extensions -

// MARK: - Keyboard presenting

private extension KeyboardHandler {

    static var keyboardPresenting: AnyPublisher<PresentingParams, Never> = {

        let paramsBuilder: (Notification) -> (keyboardSize: CGSize, animationDuration: Double)? = { notification in
            guard let userInfo = notification.userInfo else { return nil }
            guard let animationDuration = ((userInfo[UIResponder.keyboardAnimationDurationUserInfoKey]) as? NSNumber)?.doubleValue else {
                return nil
            }

            let keyboardRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero

            return (keyboardRect.size, animationDuration)
        }

        let show = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap(paramsBuilder)
            .map { PresentingParams(keyboardSize: $0.keyboardSize, animationDuration: $0.animationDuration, state: .show) }

        let hide = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .compactMap(paramsBuilder)
            .map { PresentingParams(keyboardSize: .zero, animationDuration: $0.animationDuration, state: .hide) }

        return Publishers
            .MergeMany([show, hide])
            .share(replay: 1)
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }()
}

// MARK: - Notification registration

extension KeyboardHandler {
    static func register(handler: @escaping (_ params: PresentingParams) -> Void) -> AnyCancellable {
        return keyboardPresenting
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { handler($0) })
    }

    static func register(animatedHandler: @escaping (_ params: PresentingParams) -> Void) -> AnyCancellable {
        return KeyboardHandler.register(handler: { params in
            UIView.animate(
                withDuration: params.animationDuration,
                delay: 0.0,
                options: .allowUserInteraction,
                animations: { animatedHandler(params) }
            )
        })
    }
}

