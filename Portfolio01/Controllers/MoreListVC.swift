//
//  ViewController.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/24/22.
//

import UIKit

class MoreListVC: UIViewController {
    
    // MARK: - 전역변수
    // 스토리보드 아이디
    static let storyboardID = "MoreListVC"
    let moreListDataArray = MoreListModel.getMoreListDatas()
    
    
    // MARK: - @IBOulet
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - viewDidLoad-LifeCylcle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNib()
        setupTableView()
    }
    
    fileprivate func setupNib() {
        // 닙파일 등록
        let uiNib = UINib(nibName: MoreListTVC.reuseIdentifier, bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: MoreListTVC.reuseIdentifier)
    }
    
    fileprivate func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    // arrowButton AddTarget
    @objc func customerCenterButtonTapped(sender: UIButton) {
        let vc = UIStoryboard(name: "DetailVC", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        // VC 스크린 스타일 설정
        vc.modalPresentationStyle = .overFullScreen
        // VC 띄우기
        present(vc, animated: false)
    }
    
}

// MARK: - 테이블뷰 델리게이트
extension MoreListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 고객센터 쎌을 클릭하면 화면 이동
        switch indexPath.row {
        case 0: print("🍎")
        case 1: print("⭐️")
        case 2:
            let detailVC = UIStoryboard(name: "DetailVC", bundle: nil).instantiateViewController(withIdentifier: DetailVC.storyboardID)
            self.navigationController?.pushViewController(detailVC, animated: true)
        case 3: print("👍🏻")
        default:
            break
        }
    }
}

// MARK: - 테이블뷰 데이터소스
extension MoreListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreListDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoreListTVC.reuseIdentifier, for: indexPath) as! MoreListTVC
        let cellData = moreListDataArray[indexPath.row]
        
        // 쎌 백그라운드 설정, 쎌 선택시 스타일 설정
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        // 쎌 이미지 인셋 주기
        cell.LeftImage.image = cellData.leftImage?.withAlignmentRectInsets(UIEdgeInsets(top: -8, left: -8, bottom: -8, right: -8))
        cell.titleLabel.text = cellData.titleLabel
        cell.arrowButton.setImage(cellData.arrowButtonImage, for: .normal)
        return cell
    }
    
    
    
    
}

