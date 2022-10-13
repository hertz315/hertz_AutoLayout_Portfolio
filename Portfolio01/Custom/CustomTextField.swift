//
//  CustomTextField.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/26/22.
//

import UIKit
import SnapKit

class CustomTextField: UIView {
    
    // MARK: - 생성여부
    /// 텍스트 필드를 기본 설정을 사용할것인지
    var isUseDefaultTextField: Bool = false {
        willSet {
            if newValue {
                /// addSubView
                self.addSubview(containerView)
                containerView.addSubview(stackView)
                stackView.addArrangedSubview(textFieldImageButton)
                stackView.addArrangedSubview(textField)
                // 컨테이너 뷰의 위치와 크기 잡기
                // 스택뷰의 위치와 크기 잡기
                stackView.snp.makeConstraints { make in
                    make.leading.equalTo(containerView).offset(10)
                    make.top.equalTo(containerView).offset(10)
                    make.bottom.equalTo(containerView).offset(-10)
                    make.trailing.equalTo(containerView).offset(-10)
                }
                // 텍스트필드 필드의 위치와 크기 잡기
                
            }
            // 텍스트필드 버튼의 위치와 크기 잡기
            self.textFieldImageButton.snp.makeConstraints { make in
                make.width.height.equalTo(30)
            }
        }
    }
    
    /// 텍스트 필드 height
    var textFieldHeight: Int = 60 {
        willSet {
            self.containerView.snp.updateConstraints { make in
                make.height.equalTo(newValue)
            }
        }
    }
    
    /// 텍스트 필드 하단 그림자 생성여부
    var isDrawShadow: Bool = false {
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
    /// 텍스트필드 버튼 이미지
    var textFieldButtonImage: UIImage = UIImage(systemName: "magnifyingglass")! {
        willSet {
            textFieldImageButton.setImage(newValue, for: .normal)
        }
    }
    
    // MARK: - 구성요소
    /// 검색 버튼
    let textFieldImageButton: UIButton = {
        let textFieldButton = UIButton()
        textFieldButton.backgroundColor = .clear
        textFieldButton.tintColor = .black
        textFieldButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        textFieldButton.imageView?.contentMode = .center
        return textFieldButton
    }()
    /// 텍스트필드
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.placeholder = "키워드와 #태그 모두 검색할 수 있어요."
        textField.attributedPlaceholder = NSAttributedString(string: "키워드와 #태그 모두 검색할 수 있어요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont(name: "NanumGothic", size: 14) as Any])
        textField.tintColor = .black
        return textField
    }()
    /// 검색버튼과 텍스트필드를 담을 스택뷰
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.backgroundColor = .clear
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        return stackView
    }()
    /// 스택뷰를 담을 컨테이너 뷰
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .red
        return containerView
    }()
    
    /// 생성자
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - 익스텐션 - viewDefine,addSubView,ViewPropertyManual,ViewAddTaget
extension CustomTextField {
    
    func setupView() {
        //MARK: ViewDefine
        /// 컨테이너 뷰의 속성 설정(코너 레디어스, 백그라운드 칼라, 쉐도우...)
        self.containerView.layer.cornerRadius = 6
        self.containerView.backgroundColor = UIColor.systemGray6
        self.containerView.clipsToBounds = true
        ///  addSubView
        self.addSubview(containerView)
        ///  커스템 텍스트필드 위치잡기(Constraint)
        containerView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(0)
            $0.height.equalTo(44)
        }
        ///  텍스트필드 검색버튼의 addTaget
        self.textFieldImageButton.addTarget(self, action: #selector(didTapTextFieldButton), for: .touchUpInside)
    }
    /// 텍스트필드 버튼이 눌리면 동작하는 함수
    @objc func didTapTextFieldButton() {
        print(#fileID, #function, #line, "didTapTextFieldButton - Tapped")
    }
    
}


