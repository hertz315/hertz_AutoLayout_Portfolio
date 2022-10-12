//
//  DetailTVC.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/24/22.
//

import UIKit

class DetailTVC: UITableViewCell {

    static let storyboardName = "DetailTVC"
    static let reuseIdentifier = "DetailTVC"
    
    // MARK: - @IBOulet
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 7.5, left: 0, bottom: 7.5, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }

    
}

