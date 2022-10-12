//
//  CustomNavigatonBar.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/25/22.
//

import UIKit
import SnapKit

protocol CustomNavigationBarProtocol {
    func didTapLeftButton()
    func didTapRightButton()
    func didTapRightTitleButton()
}

class CustomNavigationBar: UIView {
    //MARK: Delegate Degfine
    var delegate: CustomNavigationBarProtocol?
    //MARK: CustomNavigationBar Custom Property
    
    // MARK: - 생성여부
    var navigationHeight: Int = 60 {
        willSet {
            self.containerView.snp.updateConstraints { make in
                make.height.equalTo(newValue)
            }
        }
    }
    /// 네비게이션바 메인타이틀
    var titleText: String = "" {
        willSet {
            navigationTitleLabel.text = newValue
        }
    }
    /// 네비게이션 우측 텍스트버튼 라벨
    var rightTextButtonLabel: String = "" {
        willSet {
            rightTitleButton.setTitle(newValue, for: .normal)
        }
    }
    /// 알림 텍스트 변경
    var noticeText: String = "" {
        willSet {
            noticeCountLabel.text = newValue
        }
    }
    /// 타이틀 레이블 표시 여부
    var isVisibleTitleLabel: Bool = true {
        willSet {
            if !newValue {
                navigationTitleLabel.removeFromSuperview()
            }
        }
    }
    /// 네비게이션바 하단 크림자 생성여부
    var isDrawShadow: Bool = true {
        willSet {
            if newValue {
                self.layer.shadowOffset = CGSize(width: 0, height: 4)
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowRadius = CGFloat(8)
                self.layer.shadowOpacity = 0.12
                
            } else {
                self.layer.shadowOffset = CGSize(width: 0, height: 0)
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowRadius = CGFloat(0)
                self.layer.shadowOpacity = 0
            }
        }
    }
    /// 네비게이션 하단 선 생성 여부
    var isDrawBottomLine: Bool = true {
        willSet {
            if newValue {
                self.addSubview(bottomLine)
                self.bottomLine.snp.makeConstraints { make in
                    make.height.equalTo(1)
                    make.leading.trailing.bottom.equalToSuperview()
                }
            } else {
                self.bottomLine.removeFromSuperview()
            }
        }
    }
    /// 네비게이션 좌측 버튼 생성 여부
    var isUseLeftButton: Bool = true {
        willSet {
            if newValue {
                self.addSubview(leftButton)
                self.leftButton.snp.makeConstraints { make in
                    make.leading.equalTo(containerView).offset(10)
                    make.bottom.equalTo(containerView).offset(-10)
                    make.width.height.equalTo(30)
                }
                self.navigationTitleLabel.snp.remakeConstraints { make in
                    make.leading.equalTo(leftButton.snp.trailing).offset(5)
                    make.bottom.equalTo(containerView).offset(-10)
                }
                self.leftButton.addTarget(self, action: #selector(didTapLeftButton), for: .touchUpInside)
            }
        }
    }
    ///  우측 이미지
    var isUserRightButton: Bool = true {
        willSet {
            if newValue {
                self.addSubview(rightButton)
                self.rightButton.snp.makeConstraints { make in
                    make.trailing.equalTo(containerView).offset(-10)
                    make.bottom.equalTo(containerView).offset(-10)
                    make.width.height.equalTo(30)
                }
                self.rightButton.addTarget(self, action: #selector(didTapRightButton), for: .touchUpInside)
            }
        }
    }
    /// 내비게이션바 우측 텍스트버튼  생성 여부
    var isUserRightTextButton: Bool = true {
        willSet {
            if newValue {
                self.addSubview(rightTitleButton)
                self.rightTitleButton.snp.makeConstraints { make in
                    make.trailing.equalTo(rightButton.snp.leading).offset(-10)
                    make.bottom.equalTo(containerView).offset(-10)
                }
                self.rightTitleButton.addTarget(self, action: #selector(didTapRightTitleButton), for: .touchUpInside)
            }
        }
    }
    /// 알림 카운트모드 생성 여부
    var isNoticeCountMode: Bool = false {
        willSet {
            if newValue {
                self.addSubview(noticeImage)
                self.noticeImage.snp.makeConstraints { make in
                    make.width.height.equalTo(23)
                    make.trailing.equalTo(rightButton.snp.leading).offset(-3)
                    make.bottom.equalTo(containerView).offset(-10)
                }
                self.rightTitleButton.snp.remakeConstraints { make in
                    make.trailing.equalTo(noticeImage.snp.leading).offset(0)
                    make.bottom.equalTo(containerView).offset(-10)
                }
            }
        }
    }
    /// 알림 카운트 표시 여부
    var isVisibleNoticeMode: Bool = false {
        willSet {
            if newValue {
                noticeImage.removeFromSuperview()
                self.addSubview(rightTitleButton)
                self.rightTitleButton.snp.makeConstraints { make in
                    make.trailing.equalTo(rightButton.snp.leading).offset(-10)
                    make.bottom.equalTo(containerView).offset(-10)
                }
            }
        }
    }
    
    /// 네비게이션 좌측 버튼 이미지 생성여부
    var leftButtonImage: UIImage = UIImage(systemName: "chevron.backward")! {
        willSet {
            leftButton.setImage(newValue, for: .normal)
        }
    }
    // 네비게이션 우측 버튼 이미지 변경 (기본 = bell)
    var rightButtonImage: UIImage = UIImage(systemName: "bell")! {
        willSet {
            rightButton.setImage(newValue, for: .normal)
        }
    }
    
    // MARK: - 구성요소
    /// 컨테이너뷰
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        return containerView
    }()
    /// 네비게이션바 바텀라인
    let bottomLine: UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = .lightGray.withAlphaComponent(0.4)
        return bottomLine
    }()
    /// 좌측 버튼
    let leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftButton.tintColor = .black
        return leftButton
    }()
    /// 우측 알림버튼
    let rightButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.image = UIImage(systemName: "bell")
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 7, leading: 0, bottom: 0, trailing: 0)
        
        var rightButton = UIButton(configuration: config)
        rightButton.isSelected = true
        rightButton.isHighlighted = true
        return rightButton
    }()
    /// 알림 카운트 이미지
    let noticeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.tintColor = .red
        return imageView
    }()
    
    /// 알림 카운트 레이블
    let noticeCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: "NanumGothic", size: 12)
        label.font = label.font.bold
        label.textColor = .white
        return label
    }()
    
    /// 네비게이션바 우측 타이틀버튼
    let rightTitleButton: UIButton = {
        var config = UIButton.Configuration.gray()
        config.title = "채팅"
        config.buttonSize = .medium
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0)
        
        var rightTextButton = UIButton(configuration: config)
        rightTextButton.isSelected = true
        rightTextButton.isHighlighted = true
        rightTextButton.contentVerticalAlignment = .bottom
        return rightTextButton
    }()
    
    /// 네비게이션바 타이틀
    let navigationTitleLabel: UILabel = {
        var navigationTitleLabel = UILabel()
        navigationTitleLabel.sizeToFit()
        navigationTitleLabel.textColor = .black
        navigationTitleLabel.font = UIFont(name: "NanumGothic", size: 20)
        navigationTitleLabel.font = navigationTitleLabel.font.bold
        return navigationTitleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomNavigationBar {
   
    func setupView() {
        //MARK: ViewDefine
        let safeArea = self.safeAreaLayoutGuide
        
        
        //MARK: ViewPropertyManual
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = CGFloat(0)
        self.layer.shadowOpacity = 0
        
        
        //MARK: AddSubView
        /// 컨테이너 뷰 관련
        self.addSubview(containerView)
        containerView.addSubview(navigationTitleLabel)
        self.addSubview(rightButton)
        /// 알림 이미지뷰 관련
        noticeImage.addSubview(noticeCountLabel)
        
        
        //MARK: ViewContraints
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(safeArea)
            $0.height.equalTo(60)
        }
        /// 네비게이션바 타이틀 위치 잡기
        navigationTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalTo(containerView).offset(-10)
        }
        
        /// 알림레이블 위치 잡기
        noticeCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(noticeImage)
            make.centerY.equalTo(noticeImage)
        }
        //MARK: ViewAddTarget
        
        
        //MARK: Delegate
    }
   
    @objc func didTapLeftButton() {
        guard let delegate = self.delegate else { return }
        delegate.didTapLeftButton()
    }
    
    @objc func didTapRightButton() {
        guard let delegate = self.delegate else { return }
        delegate.didTapRightButton()
    }
    @objc func didTapRightTitleButton() {
        guard let delegate = self.delegate else {return}
        delegate.didTapRightTitleButton()
    }
    
}


//#if DEBUG
//
//import SwiftUI
//
//struct CustomNavigationBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomNavigationBar()
//            .getRepresentable()
//            .previewLayout(.sizeThatFits)
//            .frame(width: 400, height: 400)
//    }
//}
//
//#endif



