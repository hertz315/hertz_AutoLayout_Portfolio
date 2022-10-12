//
//  SalesVC.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/25/22.
//

import UIKit

class SalesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        // Do any additional setup after loading the view.
    }

    fileprivate func setupWebView() {
        guard let youtubeUrl = URL(string: "https://www.youtube.com/c/%EA%B0%9C%EB%B0%9C%ED%95%98%EB%8A%94%EC%A0%95%EB%8C%80%EB%A6%AC")   else { return }
        guard UIApplication.shared.canOpenURL(youtubeUrl) else { return }
        UIApplication.shared.open(youtubeUrl, options: [:], completionHandler: nil)
    }

}

