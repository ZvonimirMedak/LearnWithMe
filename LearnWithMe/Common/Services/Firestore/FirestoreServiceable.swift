//
//  FirestoreServiceable.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 05.12.2021..
//

import Foundation
import Combine

protocol FirestoreServiceable {
    var categoriesPublisher: AnyPublisher<[Category], LWMError> { get }
}
