//
//  AdverticeVC.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/25/22.
//

import UIKit
import WebKit

class AdverticeVC: UIViewController {

    static let storyboardID = "AdverticeVC"
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    fileprivate func setupWebView() {
        view.addSubview(webView)
        guard let url = URL(string: "https://www.youtube.com/c/%EA%B0%9C%EB%B0%9C%ED%95%98%EB%8A%94%EC%A0%95%EB%8C%80%EB%A6%AC") else {return}
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.safeAreaLayoutGuide.layoutFrame
    }

}

