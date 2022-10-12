//
//  MoreListModel.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/24/22.
//

import UIKit

enum CustomerServiceCenterSectionModel {
    case question([QuestionModel])
    case advertice([AdverticeModel])
    case sales([SalesModel])
}

struct QuestionModel {
    var leftImage: UIImage?
    let titleLabel: String
    var arrowButtonImage: UIImage?
    
    static func getQuestionModel() -> QuestionModel {
        let questionModel: QuestionModel = QuestionModel(leftImage: UIImage(systemName: "message"), titleLabel: "자주 묻는 질문", arrowButtonImage: UIImage(systemName: "chevron.right"))
        return questionModel
    }
}

struct AdverticeModel {
    var leftImage: UIImage?
    let titleLabel: String
    var arrowButtonImage: UIImage?
    
    static func getAdverticeModel() -> AdverticeModel {
        let adverticeModel: AdverticeModel = AdverticeModel(leftImage: UIImage(systemName: "wonsign.circle"), titleLabel: "광고문의", arrowButtonImage: UIImage(systemName: "chevron.right"))
        return adverticeModel
    }
}

struct SalesModel {
    var leftImage: UIImage?
    let titleLabel: String
    var arrowButtonImage: UIImage?
    
    static func getSalesModel() -> SalesModel {
        let salesModel: SalesModel = SalesModel(leftImage: UIImage(systemName: "cart"), titleLabel: "압점문의", arrowButtonImage: UIImage(systemName: "chevron.right"))
        return salesModel
    }
}

