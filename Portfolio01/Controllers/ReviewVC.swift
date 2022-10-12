//
//  ViewController.swift
//  Dailly_Challenge_reviewList
//
//  Created by Hertz on 9/21/22.
//

import UIKit

class ReviewVC: UIViewController {
    

    
    // MARK: - 전역변수
    var reviewDataArray = ReviewSectionData.getReviewDummies()
    
    // MARK: - @IBOulet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var userStatusMessage: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var averagyRatingLabel: UILabel!
    @IBOutlet weak var averagyRatingStarStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - 컨스트레이트
    
    // MARK: - viewDidLoad() - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        makeUI()
    }
    
    fileprivate func makeUI() {
        // 팔로우버튼 코너레디어스 처리
        self.followButton.layer.cornerRadius = self.followButton.frame.height / 2
        self.followingCount.text = 1111.roundedWithAbbreviations
        self.followerCount.text = 11111.roundedWithAbbreviations
    }
    
    fileprivate func setupTableView() {
        // 테이블뷰 델리게이트 채택
        tableView.delegate = self
        tableView.dataSource = self
        
        // ⭐️테이블뷰 동적 쎌 설정⭐️
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        // 테이블뷰 백그라운드 컬러 설정
        tableView.backgroundColor = .white
        
        // 커스텀 헤더Nib 등록
        let customHeaderUINib = UINib(nibName: ReviewTVCH.identifier, bundle: nil)
        tableView.register(customHeaderUINib, forHeaderFooterViewReuseIdentifier: ReviewTVCH.identifier)
        
        // 쎌Nib 등록
        let cellUINib = UINib(nibName: ReviewTVC.identifier, bundle: nil)
        tableView.register(cellUINib, forCellReuseIdentifier: ReviewTVC.identifier)
        
    }
}

// MARK: - UITableViewDataSource 델리게이트
extension ReviewVC: UITableViewDataSource {
    // 섹션이 몇개있냐
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.reviewDataArray.count
    }
    // 하나의 섹션에 몇개의 알맹이가 있냐
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviewDataArray[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    // 쎌의 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTVC.identifier, for: indexPath) as! ReviewTVC
        // 쎌의 기본 설정
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        let cellData = reviewDataArray[indexPath.section].rows[indexPath.row]
        
        cell.storeName.text = cellData.storeName
        // ⭐️ 함수의 인풋값으로 불리언값 던지기⭐️
        cell.setupBodyUI(cellData.isFold)
        // ⭐️클로저로 이벤트 넘기기⭐️
        cell.onMoreBtnClicked = { [weak self] in
            self?.reviewDataArray[indexPath.section].rows[indexPath.row].isFold.toggle()
            self?.tableView.reloadRows(at: [indexPath], with: .none)
//            self?.tableView.reloadData()
        }
        
        // ⭐️클로저로 이벤트 넘기기⭐️
        cell.onReportReviewTapped = { [weak self] in
            let sheet = UIAlertController(title: "신고", message: "이 리뷰를 정말 신고하시겠습니까?", preferredStyle: .alert)
            sheet.addAction(UIAlertAction(title: "네", style: .destructive, handler: { _ in print("yes 클릭") }))
            sheet.addAction(UIAlertAction(title: "아니요", style: .cancel, handler: { _ in print("yes 클릭") }))
            self?.present(sheet, animated: true)
        }
        return cell
    }

}

// MARK: - UITableViewDelegate 델리게이트
extension ReviewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ReviewTVCH.identifier) as? ReviewTVCH {
            headerView.userName.text = reviewDataArray[section].userNickName
            headerView.userWriteReviewCount.text = reviewDataArray[section].userWriteReviewCount

            return headerView
        }

        return nil
    }
    // ⭐️헤더뷰 높이 설정⭐️
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

}

