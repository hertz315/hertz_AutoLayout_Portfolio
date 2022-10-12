//
//  TVCell.swift
//  Dailly_Challenge_SearchView_V2
//
//  Created by Hertz on 9/16/22.
//

import UIKit

class TVCell: UITableViewCell {
    
    static let identifier = "TVCell"

    // MARK: - @IBOulet
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var LabelContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

