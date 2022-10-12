//
//  Identifying.swift
//  Dailly_Challenge_SearchView_V2
//
//  Created by Hertz on 9/17/22.
//

import UIKit

// 아이덴티 파이어 관련 프로토콜
protocol Identifying {
    static var identifier : String { get }
}

extension Identifying {
    static var identifier : String {
        return String(describing: Self.self)
    }
}

