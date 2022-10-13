//
//  KategorieCVC.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/26/22.
//

import UIKit

class CategoryCVC: UICollectionViewCell {
    
    static let reuseIdentifier = "CategoryCVC"
    static let nibName = "CategoryCVC"
    
    // MARK: - @IBOulet
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImage.layer.cornerRadius = categoryImage.bounds.height / 2
    }
    // ⭐️⭐️
    func applyUI(_ data: BaseModel, _ selectedCategory: Category) {
        if let currentData = data as? CategoryModel {
            categoryImage.image = currentData.image
            categoryLabel.text = currentData.title
            applySelectedBorder(currentData.category == selectedCategory)
            applySelectedTextColor(currentData.category == selectedCategory)
            categoryImage.layoutIfNeeded()
        }
    }
    // ⭐️⭐️
    fileprivate func applySelectedBorder(_ isSelected: Bool) {
        if isSelected {
            categoryImage.layer.borderWidth = 2
            categoryImage.layer.borderColor = UIColor.black.cgColor
        } else {
            categoryImage.layer.borderColor = UIColor.clear.cgColor
        }
    }
    // ⭐️⭐️
    fileprivate func applySelectedTextColor(_ isSelected: Bool) {
        if isSelected {
            categoryLabel.textColor = .red
            categoryLabel.font = UIFont(name: "NanumGothic", size: 12)
        } else {
            categoryLabel.textColor = .black
            categoryLabel.font = UIFont(name: "NanumGothic", size: 10)
        }
    }
    
}

