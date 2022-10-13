//
//  SalesVC.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/25/22.
//

import UIKit
import SafariServices

class SalesVC: UIViewController {
    
    static let storyboardID = "SalesVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://zeddios.tistory.com") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
}

