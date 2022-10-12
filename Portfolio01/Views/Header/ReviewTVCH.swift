//
//  ReviewTVCH.swift
//  Dailly_Challenge_reviewList
//
//  Created by Hertz on 9/21/22.
//

import UIKit

class ReviewTVCH: UITableViewHeaderFooterView {

    // MARK: - Identifier
    static let identifier = "ReviewTVCH"
    
    // MARK: - @IBOulet
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userWriteReviewCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}



