//
//  FirestoreService.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 05.12.2021..
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreCombineSwift
import Combine
import CombineExt

class FirestoreService: FirestoreServiceable {

    // MARK: - Singleton -

    static let shared = FirestoreService()

    // MARK: - Private properties -

    private let firestore = Firebase.Firestore.firestore()

    // MARK: - Init -

    private init() {}

}

extension FirestoreService {

    // MARK: - Internal properties -

    var categoriesPublisher: AnyPublisher<[Category], LWMError> {
        return firestore.collection("categories")
            .snapshotPublisher()
            .mapError { _ in return LWMError.categories }
            .map(\.documents)
            .map { data in
                return data.map { Category(name: $0.documentID, dictionary: $0.data()) }
            }
            .eraseToAnyPublisher()
}
}

