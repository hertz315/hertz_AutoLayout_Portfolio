//
//  SearchResultModel.swift
//  Dailly_Challenge_DetailSearchResult
//
//  Created by Hertz on 10/3/22.
//

import Foundation
import UIKit

// MARK: - 전역변수
let image1 = UIImage(named: "image1")
let image2 = UIImage(named: "image2")
let heartImage = UIImage(named: "heart")
let heartfillImage = UIImage(named: "heartfill")


struct SearchResultModel {
    var totalProductCoutInt: Int?
    var totalProductCoutLabel: String?
    var sortLabel: String?
    let productLabel: String
    var productPrice: String
    var productImage: UIImage?
    var likeProductImage: UIImage?
    
    static func getProduct() -> [SearchResultModel] {
        let array: [SearchResultModel] = [
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "11,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "12,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "13,000원", productImage: image1, likeProductImage: heartfillImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "11,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "12,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "13,000원", productImage: image1, likeProductImage: heartfillImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "11,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "12,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "13,000원", productImage: image1, likeProductImage: heartfillImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "11,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "12,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "13,000원", productImage: image1, likeProductImage: heartfillImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "11,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "12,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "13,000원", productImage: image1, likeProductImage: heartfillImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "11,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "12,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "13,000원", productImage: image1, likeProductImage: heartfillImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "11,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "12,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "13,000원", productImage: image1, likeProductImage: heartfillImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "11,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "12,000원", productImage: image1, likeProductImage: heartImage),
            SearchResultModel(productLabel: "날라의 식탁 슈퍼프레쉬 바이트 모음", productPrice: "13,000원", productImage: image1, likeProductImage: heartfillImage),
        ]
        return array
    }
}

