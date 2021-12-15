//
//  Publisher+Extension.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 12.12.2021..
//

import Combine
import CombineExt

extension Publisher where Failure == Never {

    func asDriver() -> Driver<Output> {
        eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .share(replay: 1)
    }

    func asSignal() -> Signal<Output> {
        eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .share(replay: 0)
    }
}

typealias Driver<Output> = Publishers.Autoconnect
<Publishers.Multicast
<Publishers.ReceiveOn
<AnyPublisher<Output, Never>, DispatchQueue>, ReplaySubject<Output, Never>>>

typealias Signal<Output> = Publishers.Autoconnect
<Publishers.Multicast
<Publishers.ReceiveOn
<AnyPublisher<Output, Never>, DispatchQueue>, ReplaySubject<Output, Never>>>
