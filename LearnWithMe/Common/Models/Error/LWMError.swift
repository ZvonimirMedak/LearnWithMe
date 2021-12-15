//
//  LWMError.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 05.12.2021..
//

import Foundation

enum LWMError: LocalizedError {
    case categories

    var errorDescription: String? {
        switch self {
        case .categories:
            return "Something went wrong while trying to fetch question categories"
        }
    }
}
