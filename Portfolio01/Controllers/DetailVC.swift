//
//  DetailVC.swift
//  Dailly_Challenge_MoreList
//
//  Created by Hertz on 9/24/22.
//

import UIKit

class DetailVC: UIViewController {
    
    // MARK: - 전역변수
    static let storyboardID = "DetailVC"
    // 쎌에 뿌려줄 데이터 배열
    var customerSeviceCenterArray = [CustomerServiceCenterSectionModel]()
    // 쎌 간격
    let cellSpacingHeight: CGFloat = 10

    // MARK: - @IBOulet
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: - viewDidLoad-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        refreshTableView()
    }
    
    fileprivate func refreshTableView() {
        // question
        let questionsModel = QuestionModel.getQuestionModel()
        let questionsSection = CustomerServiceCenterSectionModel.question([questionsModel])
        // advertice
        let adverticeModel = AdverticeModel.getAdverticeModel()
        let adverticeSection = CustomerServiceCenterSectionModel.advertice([adverticeModel])
        // sales
        let salesModel = SalesModel.getSalesModel()
        let salesSection = CustomerServiceCenterSectionModel.sales([salesModel])
        
        self.customerSeviceCenterArray = [questionsSection, adverticeSection, salesSection]
        self.tableView.reloadData()
    }
    
    /// 테이블뷰 설정 관련
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // 테이블 뷰 쎌 구분선 없애기
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        // 테이블뷰 쎌 선택표시 지우기
        
        
        // Nib파일 등록
        let nib = UINib(nibName: DetailTVC.storyboardName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DetailTVC.reuseIdentifier)
        
    }
    
    /// 네비게이션 설정 관련
    func setupNavigation() {
        self.title = "고객센터"
        self.navigationController!.navigationBar.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(backButtonTapped))
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    /// 네비게이션 백버튼 눌를시 동작하는 셀렉터
    @objc func backButtonTapped() {
        print("🙏🏻")
        self.dismiss(animated: true) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

// MARK: - 테이블뷰 델리게이트 관련
extension DetailVC: UITableViewDelegate {
    // 쎌이 선택되었을때 호출 되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // "자주 묻는 질문" 클릭하면 다음화면으로 이동
        switch [indexPath.section][indexPath.row] {
        case 0:
            print("📌")
            let questionsVC = UIStoryboard(name: "QuestionsVC", bundle: nil).instantiateViewController(withIdentifier: QuestionsVC.storyboardID)
            self.navigationController?.pushViewController(questionsVC, animated: true)
        case 1:
            print("😁")
            let adverticeVC = UIStoryboard(name: "AdverticeVC", bundle: nil).instantiateViewController(withIdentifier: AdverticeVC.storyboardID)
            self.navigationController?.pushViewController(adverticeVC, animated: true)
        case 2:
            print("🍏")
            let salesVC = UIStoryboard(name: "SalesVC", bundle: nil).instantiateViewController(withIdentifier: SalesVC.storyboardID)
            self.navigationController?.pushViewController(salesVC, animated: true)
        default:
            break
        }
    }
    
    // 몇개의 섹션을 표시할것인지
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.customerSeviceCenterArray.count
    }
    
    // 쎌의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
  
}

// MARK: - 테이블뷰 데이터 소스 관련
extension DetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.customerSeviceCenterArray[section] {
        case let .question(questionModels):
            return questionModels.count
        case let .advertice(adverticeModels):
            return adverticeModels.count
        case let .sales(salesModels):
            return salesModels.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.customerSeviceCenterArray[indexPath.section] {
        case let .question(questionModels):
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTVC.reuseIdentifier, for: indexPath) as! DetailTVC
            let cellData = questionModels[indexPath.row]
            cell.leftImage.image = cellData.leftImage?.withAlignmentRectInsets(UIEdgeInsets(top: -8, left: -8, bottom: -8, right: -8))
            cell.titleLabel.text = cellData.titleLabel
            cell.arrowButton.setImage(cellData.arrowButtonImage, for: .normal)
            cell.selectionStyle = .none
            return cell
        case let .advertice(adverticeModels):
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTVC.reuseIdentifier, for: indexPath) as! DetailTVC
            let cellData = adverticeModels[indexPath.row]
            cell.leftImage.image = cellData.leftImage?.withAlignmentRectInsets(UIEdgeInsets(top: -8, left: -8, bottom: -8, right: -8))
            cell.titleLabel.text = cellData.titleLabel
            cell.arrowButton.setImage(cellData.arrowButtonImage, for: .normal)
            cell.selectionStyle = .none
            return cell
        case let .sales(salesModels):
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTVC.reuseIdentifier, for: indexPath) as! DetailTVC
            let cellData = salesModels[indexPath.row]
            cell.leftImage.image = cellData.leftImage?.withAlignmentRectInsets(UIEdgeInsets(top: -8, left: -8, bottom: -8, right: -8))
            cell.titleLabel.text = cellData.titleLabel
            cell.arrowButton.setImage(cellData.arrowButtonImage, for: .normal)
            cell.selectionStyle = .none
            return cell
        }
    }
}

