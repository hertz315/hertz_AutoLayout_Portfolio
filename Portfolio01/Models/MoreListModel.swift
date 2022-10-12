//
//  MoreListModel.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/24/22.
//

import UIKit

struct MoreListModel {
    var leftImage: UIImage?
    let titleLabel: String
    var arrowButtonImage: UIImage?
    
    static func getMoreListDatas() -> [MoreListModel]{
        let moreList: [MoreListModel] = [
            MoreListModel(leftImage: UIImage(systemName: "speaker.wave.1"), titleLabel: "공지사항", arrowButtonImage: UIImage(systemName: "chevron.right")),
            MoreListModel(leftImage: UIImage(systemName: "gear"), titleLabel: "앱설정", arrowButtonImage: UIImage(systemName: "chevron.right")),
            MoreListModel(leftImage: UIImage(systemName: "phone"), titleLabel: "고객센터", arrowButtonImage: UIImage(systemName: "chevron.right")),
            MoreListModel(leftImage: UIImage(systemName: "text.viewfinder"), titleLabel: "약관 및 정책", arrowButtonImage: UIImage(systemName: "chevron.right")),
        ]
        return moreList
    }
}


