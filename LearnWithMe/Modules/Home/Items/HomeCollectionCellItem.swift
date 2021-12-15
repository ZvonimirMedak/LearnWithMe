//
//  HomeCollectionCellItem.swift
//  LearnWithMe
//
//  Created by Zvonimir Medak on 07.12.2021..
//

import UIKit
import Combine
import CombineExt

class HomeCollectionCellItem: NSObject {
    let title: String
    let questions: [QuestionDifficulty]
    let categorySelected: PassthroughRelay<HomeCollectionCellItem>
    let difficultySelected: PassthroughRelay<QuestionDifficulty?>

    public init(
        category: Category,
        categorySelected: PassthroughRelay<HomeCollectionCellItem>,
        difficultySelected: PassthroughRelay<QuestionDifficulty?>
    ) {
        title = category.name
        questions = category.questionDifficulties
        self.categorySelected = categorySelected
        self.difficultySelected = difficultySelected
    }
}

// MARK: - CollectionCellItem extension -

extension HomeCollectionCellItem: CollectionCellItem {

    func cell(from collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ofType: HomeCollectionCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    func didSelect(at indexPath: IndexPath) {
        categorySelected.accept(self)
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource extension -

extension HomeCollectionCellItem: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questions.count + 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row != questions.count ? questions[row].difficulty.rawValue : "Cancel"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        difficultySelected.accept(row == questions.count ? nil : questions[row])
    }
}

// MARK: - CollectionViewCell extension -

class HomeCollectionCell: UICollectionViewCell {

    // MARK: - IBOutlets

    @IBOutlet var containerView: UIView!
    @IBOutlet var titleLabel: UILabel!

    // MARK: Internal methods

    func configure(with item: HomeCollectionCellItem) {
        self.titleLabel.text = item.title
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.dropShadow()
    }
}
