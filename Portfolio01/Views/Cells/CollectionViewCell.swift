//
//  CollectionViewCell.swift
//  Dailly_Challenge_DetailSearchResult
//
//  Created by Hertz on 10/3/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let nibName = "CollectionViewCell"
    static let reuseIdentifier = "CollectionViewCell"
    
    // MARK: - @IBOulet
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productLikeButton: UIButton!
    
}

