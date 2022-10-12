//
//  CustomerCenterModel.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/26/22.
//

import UIKit

// 전역변수
let imageE1 = UIImage(named: "E1")
let imageE2 = UIImage(named: "E2")
let imageE3 = UIImage(named: "E3")
let imageE4 = UIImage(named: "E4")
let imageE5 = UIImage(named: "E2")
let likeImage = UIImage(systemName: "heart")
let chatImage = UIImage(systemName: "message")
let image = UIImage(named: "도배배")

/// 카테고리 베이스 모델 프로토콜 ( 하나의 타입으로 만들기 위해서)
protocol BaseModel {
    
}

/// 카테고리 케이스
enum Category: CaseIterable {
    case all
    case inquiry
    case price
    case searchExpert
    case order
    
    var title: String {
        switch self {
        case .all:
            return "전체"
        case .inquiry:
            return "문의"
        case .price:
            return "가격"
        case .searchExpert:
            return "전문가검색"
        case .order:
            return "의뢰하기"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .all:
            return imageE1
        case .inquiry:
            return imageE2
        case .price:
            return imageE3
        case .searchExpert:
            return imageE4
        case .order:
            return imageE2
        }
    }
    
    /// 현재 나의 카테고리를 가진 모델 반환
    /// - Returns:
    func getCategoryModel() -> CategoryModel {
        return CategoryModel(title: self.title, image: self.image ?? UIImage(systemName: "x.circle")!, category: self)
    }
}


/// 메인 카테고리 모델
struct CategoryModel : BaseModel {
    let title: String
    let image: UIImage
    let category: Category
}

/// 디테일 카테고리 모델
struct DetailCategory: BaseModel {
    var category: Category
    let categoryLabel: String
    let titleLabel: String
    let bodyLabel: String
    let likeLabel: String
    let chatLabel: String
    let hashTag: String
    let initDate: String
    var mainImage: UIImage?
    var likeButtonImage: UIImage?
    var chatButtonImage: UIImage?
    
    /// 추천 카테고리 목록
    static func getRecommandedCategories() -> [DetailCategory] {
        let array: [DetailCategory] = [
            DetailCategory(category: .all, categoryLabel: "문의", titleLabel: "추천 - 천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "가격", titleLabel: "추천 - 새우볶음밥 가격", bodyLabel: "새우볶음밥 구매할려고 합니다 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 새우볶음밥", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "추천 - 가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "추천 - 도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "추천 - 가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "추천 - 도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "추천 - 가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "추천 - 도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            
        ]
        return array
    }
    
    static func getCategoryAll() -> [DetailCategory] {
        let array: [DetailCategory] = [
            DetailCategory(category: .all, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "가격", titleLabel: "새우볶음밥 가격", bodyLabel: "새우볶음밥 구매할려고 합니다 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 새우볶음밥", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .all, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "가격", titleLabel: "새우볶음밥 가격", bodyLabel: "새우볶음밥 구매할려고 합니다 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 새우볶음밥", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .all, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "가격", titleLabel: "새우볶음밥 가격", bodyLabel: "새우볶음밥 구매할려고 합니다 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 새우볶음밥", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
        ]
        return array
    }
    
    static func getCategoryInquiry() -> [DetailCategory] {
        let array: [DetailCategory] = [
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .inquiry, categoryLabel: "문의", titleLabel: "천장도배", bodyLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeLabel: 1111.roundedWithAbbreviations, chatLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: image ?? UIImage(systemName: "perseon"), likeButtonImage: likeImage, chatButtonImage: chatImage),
         
        ]
        return array
    }
    
    static func getCategoryPrice() -> [DetailCategory] {
        let array: [DetailCategory] = [
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .price, categoryLabel: "가격", titleLabel: "가격 문의", bodyLabel: "전동드릴 가격은 얼마인가요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 전동드릴", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
        ]
        return array
    }
    
    static func getCategorySearchExpert() -> [DetailCategory] {
        let array: [DetailCategory] = [
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .searchExpert, categoryLabel: "전문가검색", titleLabel: "도배 전문가", bodyLabel: "도배 견적 봐주세요", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 도배견적", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
        ]
        return array
    }
    
    static func getCategoryOrder() -> [DetailCategory] {
        let array: [DetailCategory] = [
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            DetailCategory(category: .order, categoryLabel: "의뢰하기", titleLabel: "샷시 견적 봐주세요", bodyLabel: "이 부분 샷시 하는데 견적이 얼마일까요?", likeLabel: 11111.roundedWithAbbreviations, chatLabel: 2222.roundedWithAbbreviations, hashTag: "# 샷시", initDate: "30분 전", mainImage: image, likeButtonImage: likeImage, chatButtonImage: chatImage),
            
        ]
        return array
    }
}


