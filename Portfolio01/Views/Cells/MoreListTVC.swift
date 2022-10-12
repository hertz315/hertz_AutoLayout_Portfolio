//
//  MoreListTVC.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/24/22.
//

import UIKit

class MoreListTVC: UITableViewCell {

    static let reuseIdentifier = "MoreListTVC"
    
    // MARK: - @IBOulet
    @IBOutlet weak var LeftImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowButton: UIButton!
    
    // 이벤트를 받을 클로저 정의
    
    // MARK: - @IBAction
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

