//
//  QuestionsVC.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/25/22.
//

import UIKit

class QuestionsVC: UIViewController {
    
    static let storyboardID = "QuestionsVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "http://zeddios.tistory.com"), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
    }
    
    
    
    
}

