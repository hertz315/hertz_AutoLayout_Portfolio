//
//  HorizentalKategoriesCVCCollectionViewCell.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/28/22.
//

import UIKit

class RecommendedcategoryCVC: UICollectionViewCell {
    
    static let nibName = "RecommendedcategoryCVC"
    static let reuseIdentifier = "RecommendedcategoryCVC"

    // MARK: - @IBOulet
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var chatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /// 쎌에 데이터 적용 -> UI 변경
    /// - Parameter data: 디테일 카테고리
    func apply(_ data: BaseModel){
        if let data = data as? DetailCategory {
            categoryLabel.text = data.categoryLabel
            bodyLabel.text = data.bodyLabel
            chatLabel.text = data.chatLabel
        }
    }
}

