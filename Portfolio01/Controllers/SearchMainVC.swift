//
//  MainVC.swift
//  Dailly_Challenge_SearchView_V2
//
//  Created by Hertz on 9/16/22.
//

import UIKit

class SearchMainVC: UIViewController {

    static let identifier = "MainVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func moveMainVC(_ sender: UIButton) {
        
        if let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") {
            self.navigationController?.pushViewController(searchVC, animated: true
            )
        }
            
    }
    


}

