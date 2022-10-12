//
//  ReviewData.swift
//  Dailly_Challenge_reviewList
//
//  Created by Hertz on 9/21/22.
//

import UIKit

struct ReviewSectionData {
    
    let uuid = UUID()
    
    var rows: [ReviewRowData]
    let userNickName: String
    let userWriteReviewCount: String

    init() {
        self.rows = ReviewRowData.getReviewDummies()
        self.userNickName = "오늘도 빡코딩"
        self.userWriteReviewCount = "62"
    }
    
    static func getReviewDummies(_ count: Int = 2) -> [ReviewSectionData] {
        return (1...count).map{_ in ReviewSectionData() }
    }
    
}

struct ReviewRowData {
    
    let storeName: String
    let storeDetailName: String
    var userUpLoadImage: UIImage?
    var userRating: String
    let userWriteDate: String
    var reviewTitle: String
    var reviewBody: String
    // ⭐️ 더보기 접힘 ⭐️
    var isFold : Bool = true
    
    init() {
        self.storeName = "수미수미"
        self.storeDetailName = "빡코빡코딩점"
        self.userUpLoadImage = UIImage(named: "reviewImage")
        self.userRating = "5.0"
        self.userWriteDate = "2022.08.08"
        self.reviewTitle = "너무 너무 맛없"
        self.reviewBody = "노래하며 같이 이성은 새 미인을 것은 끓는 것이다. 속에 보이는 착목한는 따뜻한 위하여, 약동하다. 없으면 얼음에 열락의 그들에게 그들의 것이다. 원대하고, 대중을 물방아 행복스럽고 얼마나 능히 굳세게 내려온 아름다우냐? 살 심장은 든 소리다.이것은 바로 불러 것이다. 그들에게 트고, 길을 들어 청춘은 힘있다. 인간에 미인을 인간의 이 뜨고, 칼이다. 우리의 곧 웅대한 어디 피는 새 힘차게 사막이다. 별과 놀이 피는 피고, 속에 품고 있으며, 봄바람이다. 군영과 스며들어 꽃 않는 인간의 영원히 설레는 것이다. 든 끝에 품었기 하여도 소담스러운 무한한 굳세게 철환하였는가?"
    }
    
    static func getReviewDummies(_ count: Int = 5) -> [ReviewRowData] {
        return (1...count).map{_ in ReviewRowData() }
    }
}

