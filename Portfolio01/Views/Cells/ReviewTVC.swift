//
//  ReviewTVC.swift
//  Dailly_Challenge_reviewList
//
//  Created by Hertz on 9/21/22.
//

import UIKit

class ReviewTVC: UITableViewCell {
    
    // 플래그 설정
    var isLikeButtonTapped: Bool = false
    var isSeeMoreButtonTapped: Bool = false
    
    // 좋아요 숫자 변수를 담을 공간 생성
    var likeButtonCount: Int = 999
    
    
    static let identifier = "ReviewTVC"
    
    
    // MARK: - @IBOulet
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var userUploadImage: UIImageView!
    @IBOutlet weak var storeDetailName: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reivewWriteDate: UILabel!
    @IBOutlet weak var reviewTitle: UILabel!
    @IBOutlet weak var reviewBody: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeTappedCount: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var chatTappedCount: UILabel!
    @IBOutlet weak var reportReviewButton: UIButton!
    
    // MARK: - 컨스트레인트
    @IBOutlet weak var seeMoreButtonHeight: NSLayoutConstraint!
    
    // ⭐️cellForRowAt에서 이벤트받아서 처리할 클로저 생성⭐️
    var onMoreBtnClicked : (() -> Void)? = nil
    var onReportReviewTapped: (() -> ())? = nil
    
    // MARK: - awakeFromNib-LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupButtonTint()
        setupLikeCount()
        
    }
    
    
    /// ⭐️바디 텍스트 부분 UI 적용⭐️
    func setupBodyUI(_ isFold : Bool) {
        self.reviewBody.numberOfLines = isFold ? 5 : 0
        let btnTitle = isFold ? "더보기" : "줄여서보기"
        self.seeMoreButton.setTitle(btnTitle, for: .normal)
        self.contentView.layoutIfNeeded()
    }
    
    @IBAction func seeMoreButtonTapped(_ sender: UIButton) {
        print("seeMoreButtonTapped")
        // ⭐️클로저로 정의한 수식 터트리기⭐️
        onMoreBtnClicked?()
    }
    
    fileprivate func setupLikeCount() {
        self.likeTappedCount.text = self.likeButtonCount.roundedWithAbbreviations
    }
    
    /// 버튼 틴트 컬러 설정
    fileprivate func setupButtonTint() {
        self.likeButton.tintColor = .systemPink
        self.chatButton.tintColor = .systemPink
    }
    // MARK: - @IBAction
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        if self.isLikeButtonTapped == false {
            // 하트버튼을 눌르면 이미지변경
            self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            // likeButtonCount += 1 저장
            self.likeButtonCount += 1
            // 좋아요눌린 숫자 레이블 텍스트에 좋아요 카운트 할당하기
            self.likeTappedCount.text = self.likeButtonCount.roundedWithAbbreviations
            // 불리언값으로 버튼을 눌렸는지 안눌렸는지 알아볼려고 설정한 플래그를 변경해주기
            self.isLikeButtonTapped.toggle()
        } else {
            // 하트버튼을 눌르면 이미지 변경
            self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            // likeButtonCount -= 1 저장
            self.likeButtonCount -= 1
            // 좋아요눌린 숫자 레이블 텍스트에 좋아요 카운트 할당하기
            self.likeTappedCount.text = self.likeButtonCount.roundedWithAbbreviations
            // 불리언값으로 버튼을 눌렀는지 안눌렀는지 알아볼려고 설정한 플래그를 변경해주기
            self.isLikeButtonTapped.toggle()
        }
    }
    
    @IBAction func reportReviewButtonTapped(_ sender: UIButton) {
        // ⭐️이벤트를 정의한후 넘겨준 클로저로 터트리기⭐️
        onReportReviewTapped?()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}


