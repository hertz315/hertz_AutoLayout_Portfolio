//
//  VerticalKategoriesCVC.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/28/22.
//

import UIKit

class VerticalCategoryCVC: UICollectionViewCell {
    
    static let reuseIdentifier = "VerticalCategoryCVC"
    static let nibName = "VerticalCategoryCVC"
    
    // MARK: - @IBOulet
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryBodyLabel: UILabel!
    @IBOutlet weak var categoryMainImage: UIImageView!
    @IBOutlet weak var hashTagLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var initLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// 쎌에 데이터 적용 -> UI 변경
    /// - Parameter data: 디테일 카테고리
    func apply(_ data: BaseModel){
        
        if let data = data as? DetailCategory {
            categoryTitleLabel.text = data.categoryLabel
            categoryBodyLabel.text = data.bodyLabel
            chatLabel.text = data.chatLabel
        }
    }

}

