//
//  AssociableCollectionCellItem.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 05.12.2021..
//

import UIKit

/// Extended interface for all collection view cell items
/// - helps to remove bolierplate when creating cell items
/// - used in conjuction with `CollectionDataSourceDelegate`
public protocol AssociableCollectionCellItem: CollectionCellItem {
    associatedtype AssociatedCell: UICollectionViewCell, ItemConfigurable
}

extension AssociableCollectionCellItem where Self == Self.AssociatedCell.ConfigurationItem {

    /// Dequeues and configures reusable cell at given index path
    /// from given collection view
    ///
    /// - Parameters:
    ///   - collectionView: parent collection view
    ///   - indexPath: index path of cell to configure
    /// - Returns: Dequeued, configured and reused cell
    func cell(from collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ofType: AssociatedCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

}
