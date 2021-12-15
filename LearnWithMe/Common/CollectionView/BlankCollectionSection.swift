//
//  BlankCollectionSection.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 05.12.2021..
//

import Foundation

public class BlankCollectionSection: CollectionSectionItem {

    public var items: [CollectionCellItem]

    public init(items: [CollectionCellItem]) {
        self.items = items
    }

    public convenience init?(items: [CollectionCellItem]?) {
        guard let items = items else {
            return nil
        }
        self.init(items: items)
    }

}
