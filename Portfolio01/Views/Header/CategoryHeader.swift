//
//  KategoriesHeader.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/27/22.
//

import UIKit
import SnapKit

class CategoryHeader: UICollectionReusableView {
    
    static let reuseIdentifier = "CategoryHeader"
    static let nibName = "CategoryHeader"
    
    let customTextField = CustomTextField()
    let customNavigationBar = CustomNavigationBar()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- ")
        setupTextField()
    }
    
    fileprivate func setupTextField() {
        self.addSubview(customTextField)
        customTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
        /// 커스텀텍스트필드를 기본모든 사용모드로 할것인지
        self.customTextField.isUseDefaultTextField = true
        /// 커스텀텍스트필드의 높이를 지정
        self.customTextField.textFieldHeight = 44
    }
    
}




