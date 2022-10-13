//
//  ViewController.swift
//  Dailly_Challenge_SearchView_V2
//
//  Created by Hertz on 9/16/22.
//

import UIKit

// MARK: - 아이덴티파이어
extension SearchVC: Identifying {}


class SearchVC: UIViewController {
    
    // MARK: - @IBOulet
    @IBOutlet weak var SearchStackView: UIStackView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var recommendedLabel: UILabel!
    @IBOutlet weak var recommendedTagStackView: UIStackView!
    @IBOutlet weak var recentSearchesStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // MARK: - @IBAction
    
    /// 검색버튼
    /// - Parameter sender:
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        searchData.mainTitle = searchTextField.text
        contentArray.append(searchData)
        
        self.searchTextField.text = ""
        self.recentSearchesStackView.isHidden = false
        self.tableView.isHidden = false
        self.searchStackViewHeight.constant = 30
        // ⭐️ 검색어가 추가될때마다 테이블뷰의 높으를 변경
        self.tableViewHeight.constant = CGFloat(contentArray.count * 40)
        // 이미 추가된 단어는 중복으로 기록되지 않습니다
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    /// 이건 어때요? 태그 클릭시 실행하는 함수
    @IBAction func tagKeyWords(_ sender: UIButton) {
        searchTextField.text = sender.currentTitle
    }
    
    // MARK: - ⭐️모두 지우기 버튼⭐️
    /// 모두 지우기 버튼이 클릭되면 모든 최근 검색어는 지워지고 최근 검색어 섹션은 사라집니다.
    /// - Parameter sender:
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        contentArray.removeAll()
        self.tableView.isHidden = true
        self.recentSearchesStackView.isHidden = true
        self.searchStackViewHeight.constant = 0
        self.tableViewHeight.constant = 0
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
    }
    
    // MARK: - 컨스트레이언트
    @IBOutlet weak var searchTextFieldToSearchButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchStackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    // MARK: - 전역변수
    var searchData = SearchDataModel()
    var contentArray: [SearchDataModel] = []
    
    // MARK: - viewDidLayoutSubviews-LifeCycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpTextField()
    }
    
    // MARK: - viewDidLoad-LifeCycle
    ///  앱이 실행될때 메모리에 처음 올려지는 함수 초기화용도로 활용
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNaviColor()
        setUpInitialSearchVC()
        setUpTextFieldKeyboard()
        setUpView()
        setUpTextField()
        setUpNavigation()
        setUpKeyboardToolBar()
        setUpTableViewCell()
        setUpTableView()
        setUpKeyboardDown()
    }
    
    
    ///  테이블뷰 설정
    func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.6)
        self.tableView.separatorStyle = .none
    }
    
    ///  테이블뷰 쎌 닙파일 등록
    func setUpTableViewCell() {
        let uiNib = UINib(nibName: TVCell.identifier, bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: TVCell.identifier)
    }
    
    /// 네비게이션  컬러 설정
    func setUpNaviColor() {
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    // 네비게이션을 통해 검색화면으로 넘어가자마자 텍스트필드에 포커스 하기
    /// 네비게이션을 통해 검색화면으로 넘어가자마자 텍스트필드 포커스 + 최근 검색어 요소 숨기기
    func setUpInitialSearchVC() {
        self.searchTextField.becomeFirstResponder()
        self.recentSearchesStackView.isHidden = true
        self.recentSearchesStackView.isHidden = true
        self.searchStackViewHeight.constant = 0
        self.tableViewHeight.constant = 0
    }
    
    
    /// 키보드타입 설정
    func setUpTextFieldKeyboard() {
        // 키보드 타입
        self.searchTextField.keyboardType = UIKeyboardType.alphabet
        // 리턴키 타입
        self.searchTextField.returnKeyType = UIReturnKeyType.go
        // 리턴키 자동 활성화
        self.searchTextField.enablesReturnKeyAutomatically = true
    }
    
    
    /// 툴바 설정
    func setUpKeyboardToolBar() {
        let toolbar = UIToolbar()
        let doneBtn = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(searchTearm))
        let keyboardLabel = UIBarButtonItem(title: "무엇을 찾으세요?", style: .plain, target: self, action: nil)
        keyboardLabel.tintColor = UIColor.gray
        toolbar.backgroundColor = UIColor(red: 246, green: 246, blue: 246, alpha: 1)
        let flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.sizeToFit()
        
        toolbar.setItems([flexibleSpaceButton,flexibleSpaceButton,keyboardLabel,flexibleSpaceButton,doneBtn], animated: false)
        searchTextField.inputAccessoryView = toolbar
    }
    
    // MARK: - ⭐️완료 버튼 클릭⭐️
    /// 완료를 클릭시 검색어 버튼이 입력된 것과 같은 로직으로 실행됩니다
    @objc func searchTearm() {
        searchData.mainTitle = searchTextField.text
        contentArray.append(searchData)
        self.searchTextField.text = ""
        self.searchTextField.resignFirstResponder()
        self.recentSearchesStackView.isHidden = false
        self.recentSearchesStackView.isHidden = false
        self.searchStackViewHeight.constant = 30
        // 검색어가 추가될때마다 테이블뷰의 높이를 변경
        self.tableViewHeight.constant = CGFloat(contentArray.count * 40)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    /// 뷰 설정
    func setUpView() {
        view.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.6)
    }
    
    // MARK: - 네비게이션바 아이템 빽 버튼 Color(RGB) 설정 안됨 - ⭐️
    /// 네비게이션 셋팅
    func setUpNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationItem.title = "검색"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Arrow - Left 2"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Bag 2"), style: .plain, target: self, action: nil)
        // 임시로 UIColor.black 처리
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    /// 스크롤뷰 에서 바깥에 화면 터치시 키보드 내리는 함수
    func setUpKeyboardDown() {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MyTapMethod(_:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    
    ///  스크롤뷰 에서 바깥에 화면 터치시 키보드 내리는 함수
    @objc func MyTapMethod(_ sender: UITapGestureRecognizer) { self.view.endEditing(true)
    }
    
    
    /// 텍스트필드 초기설정
    func setUpTextField() {
        // 텍스트필드 델리게이트 채택
        searchTextField.delegate = self
        // 텍스트필드 클리어 버튼 - 완료
        // ⭐️ 텍스트필드에 텍스트를 입력하면 x버튼 활성화 되고 x 버튼을 눌르면 텍스트가 초기화 된다
        searchTextField.clearButtonMode = .whileEditing
        // 텍스트필드 밑줄 커스텀
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: searchTextField.frame.size.height - 1.0  , width: searchTextField.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        searchTextField.layer.addSublayer(bottomLine)
        searchTextField.textAlignment = .center
        searchTextField.textColor = UIColor.white
        searchTextField.borderStyle = .none
        // 텍스트필드 설정
        searchTextField.placeholder = "무엇을 찾으세요?"
        searchTextField.leftViewMode = .always
        searchTextField.textAlignment = .left
        searchTextField.textColor = .black
    }
    
}

// MARK: - 텍스트필드 델리게이트
extension SearchVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("⭐️")
    }
    
    ///  텍스트필드를 클릭하면 텍스트필드값 초기화
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.searchTextField.text = ""
        return true
    }
    
    /// 리턴 버튼 눌르면 실행되는 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchData.mainTitle = searchTextField.text
        contentArray.append(searchData)
        searchTextField.text = ""
        textField.resignFirstResponder()
        self.recentSearchesStackView.isHidden = false
        self.tableView.isHidden = false
        self.searchStackViewHeight.constant = 30
        self.tableViewHeight.constant = CGFloat(contentArray.count * 40)
        // 이미 추가된 단어는 중복으로 기록되지 않습니다
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        return true
    }
}

extension SearchVC: UITableViewDelegate {
    
}


extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TVCell.identifier, for: indexPath) as! TVCell
        cell.mainTitle.text = contentArray[indexPath.row].mainTitle
        return cell
    }
    
    
}


