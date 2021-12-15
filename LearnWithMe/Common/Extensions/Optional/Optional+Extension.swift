//
//  Optional+Extension.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 12.12.2021..
//

import Foundation

extension Optional {
    var isBlank: Bool {
        return self == nil
    }
}
