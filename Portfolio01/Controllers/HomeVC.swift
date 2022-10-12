//
//  ViewController.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/25/22.
//

import UIKit
import SnapKit

final class HomeVC: UIViewController {
    // MARK: - 전역변수
    /// 섹션  데이터 모델을 만들기 위해서 -> 2차원 배열로 데이터 모델 생성
    var categoryDataList : [[BaseModel]] = []
    
    /// 선택된 카테고리
    var selectedCategory: Category = .all {
        didSet {
            print("카테고리 체크: selectedCategory: didSet : \(selectedCategory.title)")
        }
    }
    
    // MARK: - 네비게이션 바 생성
    // 네비게이션바 생성
    lazy var customNavigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        /// 네비게이션바 타이틀 텍스트 지정
        navigationBar.titleText = "고객센터"
        /// 네비게이션바 높이 지정, 미지정시 60
        navigationBar.navigationHeight = 50
        /// 네비게이션 우측 텍스트 지정
        navigationBar.rightTextButtonLabel = "채팅"
        /// 네비게이션 알림 텍스트
        navigationBar.noticeText = "2"
        /// 네비게이션바 왼쪽에 버튼을 넣을것인지
        navigationBar.isUseLeftButton = false
        /// 네비게이션바오른쪽에 텍스트버튼을 넣을것인지
        navigationBar.isUserRightTextButton = true
        /// 네비게이션바오른쪽에 버튼을 넣을것인지
        navigationBar.isUserRightButton = true
        /// 네비게이션바에 알림을 넣을것인지
        navigationBar.isNoticeCountMode = true
        return navigationBar
    }()
    
    // MARK: - 컬렉션뷰 생성
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: HomeVC.getCollectionViewCompositionalLayout())
        // 스크롤링 사용할것인지
        view.isScrollEnabled = true
        // 가로 스크롤바 표시 여부
        view.showsHorizontalScrollIndicator = false
        // 세로 스크롤바 표시 여부
        view.showsVerticalScrollIndicator = true
        // contentInset은 컨텐츠에 상하좌우 여백
        view.contentInset = .zero
        // 백그라운드 컬러
        view.backgroundColor = .clear
        // subview들이 view의 bounds에 가둬질 수 있는 지를 판단하는 Boolean 값
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLayout()
        customNavigationBar.delegate = self
        setupCollectionViewData()
    }
    
    /// 컬렉션뷰 데이터 관련
    fileprivate func setupCollectionViewData() {
        let categoryModels: [BaseModel] = Category.allCases.map{$0.getCategoryModel()}
        let recommendedList: [BaseModel] = DetailCategory.getRecommandedCategories()
        let allList: [BaseModel] = DetailCategory.getCategoryAll()
        
        /// 3개의 섹션 등록
        categoryDataList.append(categoryModels)
        categoryDataList.append(recommendedList)
        categoryDataList.append(allList)
        
        collectionView.reloadData()
    }
    
    /// 네비게이션바 컬렉션바 위치잡기
    fileprivate func setupLayout() {
        /// 네비게이션바 오토레이아웃
        self.view.addSubview(customNavigationBar)
        self.customNavigationBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(customNavigationBar.containerView)
        }
        /// 컬렉션뷰 오토레이아웃
        self.view.addSubview(collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(customNavigationBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    // MARK: - 컴포지셔널 레이아웃 생성
    static func getCollectionViewCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값) 의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return HomeVC.getMainCompostionalLayoutSection()
            case 1:
                return HomeVC.getHorizentalCompositinalLayoutSection()
            case 2:
                return HomeVC.getVerticalCompositionalLayoutSection()
            default:
                return nil
            }
        }
        return layout
    }
    // MARK: - 컬렉션뷰 레지스터, 델리게이트 채택
    fileprivate func setupCollectionView() {
        /// 메인 카테고리 쎌 레지스터
        let uiNib = UINib(nibName: CategoryCVC.nibName, bundle: nil)
        collectionView.register(uiNib, forCellWithReuseIdentifier: CategoryCVC.reuseIdentifier)
        
        /// 메인 카테고리 헤더 레지스터
        let mainHeaderUiNib = UINib(nibName: CategoryHeader.nibName, bundle: nil)
        collectionView.register(mainHeaderUiNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryHeader.reuseIdentifier)
        /// 메인 카테고리 푸터 레지스터
        let mainFooterUiNib = UINib(nibName: CategoryFooter.nibName, bundle: nil)
        collectionView.register(mainFooterUiNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CategoryFooter.reuseIdentifier)
        /// 호리젠탈 카테고리 쎌 레지스터
        let horizentalnUiNib = UINib(nibName: RecommendedcategoryCVC.nibName, bundle: nil)
        collectionView.register(horizentalnUiNib, forCellWithReuseIdentifier: RecommendedcategoryCVC.reuseIdentifier)
        /// 호리젠탈 카테고리 헤더 레지스터
        let horizentalHeaderUiNib = UINib(nibName: DetailCategoryHeader.nibName, bundle: nil)
        collectionView.register(horizentalHeaderUiNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailCategoryHeader.reuseIdentifier)
        /// 버티컬 카테고리 쎌 레지스터
        let verticalUiNib = UINib(nibName: VerticalCategoryCVC.nibName, bundle: nil)
        collectionView.register(verticalUiNib, forCellWithReuseIdentifier: VerticalCategoryCVC.reuseIdentifier)
        // ⭐️⭐️
        /// 버티컬 카테고리 푸터 레지스터
        let detailCategoryFooter = UINib(nibName: DetailCategoryFooter.nibName, bundle: nil)
        collectionView.register(detailCategoryFooter, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: DetailCategoryFooter.reuseIdentifier)
        // ⭐️⭐️
        /// 델리게이트 등록
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        /// 쎌 셀프 사이징
        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}


// MARK: - 컬렉션뷰 델리게이트 관련
extension HomeVC: UICollectionViewDelegate {
    
    /// 쎌이 선택될때마다 호출되는 메서드
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        /// 0번째 섹션이 아니라면 리턴
        if indexPath.section != 0 {return}
        /// 선택된 아이템의 카테고리를 카테고리 플래그 카테고리 목록에 할당한다
        if let selectedItem = categoryDataList[0][indexPath.item] as? CategoryModel {
            self.selectedCategory = selectedItem.category
            print("카테고리 체크: selectedItem.category: \(selectedItem.category.title)")
            self.collectionView.reloadData()
        }
        
        switch selectedCategory {
        case .all:
            categoryDataList[2] = DetailCategory.getCategoryAll()
            self.collectionView.reloadData()
        case .inquiry:
            categoryDataList[2] = DetailCategory.getCategoryInquiry()
            self.collectionView.reloadData()
        case .price:
            categoryDataList[2] = DetailCategory.getCategoryPrice()
            self.collectionView.reloadData()
        case .searchExpert:
            categoryDataList[2] = DetailCategory.getCategorySearchExpert()
            self.collectionView.reloadData()
        case .order:
            categoryDataList[2] = DetailCategory.getCategoryOrder()
            self.collectionView.reloadData()
        }
    }
    
    /// 컬렉션뷰 헤더 풋터뷰 등록
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionIndex = indexPath.section
        /// 섹션 인덱스와, kind 를 비교하여 헤더 할당하기
        switch (kind, sectionIndex) {
        case (UICollectionView.elementKindSectionHeader, 0):
            let mainHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryHeader.reuseIdentifier, for: indexPath) as! CategoryHeader
            return mainHeader
        case (UICollectionView.elementKindSectionFooter, 0):
            let mainFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryFooter.reuseIdentifier, for: indexPath) as! CategoryFooter
            return mainFooter
        case (UICollectionView.elementKindSectionHeader, 1):
            let recommendedHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailCategoryHeader.reuseIdentifier, for: indexPath) as! DetailCategoryHeader
            return recommendedHeader
        // ⭐️⭐️
        case (UICollectionView.elementKindSectionFooter, 2):
            let detailFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailCategoryFooter.reuseIdentifier, for: indexPath) as! DetailCategoryFooter
            return detailFooter
        // ⭐️⭐️
        default:
            return UICollectionReusableView()
        }
    }

}

// MARK: - 컬렉션뷰 데이터소스 관련
extension HomeVC: UICollectionViewDataSource {
    /// 섹션이 몇개???
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(categoryDataList.count, "🍎🍎🍎")
        return categoryDataList.count
    }
    /// 각 세션당 아이템이 몇개???
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryDataList[section].count
    }
    
    /// 쎌들의 아이템 요소
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData: BaseModel = categoryDataList[indexPath.section][indexPath.item]
        let sectionIndex = indexPath.section
        
        switch sectionIndex {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.reuseIdentifier, for: indexPath) as! CategoryCVC
            cell.applyUI(cellData, self.selectedCategory)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedcategoryCVC.reuseIdentifier, for: indexPath) as! RecommendedcategoryCVC
            cell.apply(cellData)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCategoryCVC.reuseIdentifier, for: indexPath) as! VerticalCategoryCVC
            cell.apply(cellData)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
   
    
}

// MARK: - ⭐️컴포지셔널 섹션 레이아웃 잡기⭐️
extension HomeVC {
    /// 메인섹션 레이아웃 잡기
    static func getMainCompostionalLayoutSection() -> NSCollectionLayoutSection {
        
        /// 아이템사이즈 - 그룹의 가로크기의 1/5, 최소크기 50
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/6), heightDimension: .estimated(50))
        /// 아이템사이즈로 아이템 만들기
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // 아이템간의 여백 설정
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        /// 그룹사이즈 - 컬렉션뷰 가로길의의 1, 아이템사이즈의 높이크기(50)
        let groupSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.3),
                                                heightDimension: .estimated(80))
        /// 그룹사이즈로 그룹만들기
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        /// 헤더사이즈 -
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(65))
        /// 헤더만들기
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        /// 풋터사이즈 -
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(30))
        /// 풋터만들기
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        /// 섹션
        let section = NSCollectionLayoutSection(group: group)
        /// 섹션에 헤더, 풋터 등록
        section.boundarySupplementaryItems = [header,footer]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        /// 반환
        return section
    }
    /// 호리젠탈 섹션 레이아웃 잡기
    static func getHorizentalCompositinalLayoutSection() -> NSCollectionLayoutSection {
        /// 아이템사이즈 - 그룹 가로길이의 1/2, 그룹 세로길이의 1/1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        /// 아이템사이즈로 아이템 만들기
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        /// 그룹사이즈 - 컬렉션 뷰의 가로 길이의 1.15배, 컬렉션 뷰의 세로 길이의 1/3.8
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.15), heightDimension: .fractionalHeight(1.0/3.0))
        /// 그룹사이즈로 그룹만들기
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        /// 헤더사이즈 -
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
        /// 헤더 만들기
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        /// 섹션
        let section = NSCollectionLayoutSection(group: group)
        /// 섹션에 헤더 등록
        section.boundarySupplementaryItems = [header]
        /// 섹션의 스크롤 설정
        section.orthogonalScrollingBehavior = .continuous
        /// 섹션 반환
        return section
    }
    /// 버티컬 섹션 레이아웃 잡기
    static func getVerticalCompositionalLayoutSection() -> NSCollectionLayoutSection {
        /// 아이템사이즈 - 그룹 가로길이의 1/1, 그룹 세로길이의 1/4,
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(237))
        /// 아이템사이즈로 아이템만들기
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        /// 그룹사이즈 - 컬렉션뷰 가로길이의 1/1, 컬렉션뷰 세로길이의 1/3
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2))
        /// 그룹사이즈로 그룹만들기
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        // ⭐️⭐️
        /// 풋터 사이즈
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        /// 풋터만들기
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        /// 섹션
        let section = NSCollectionLayoutSection(group: group)
        /// 섹션에 헤더, 풋터 등록
        section.boundarySupplementaryItems = [footer]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        /// 섹션반환
        return section
        // ⭐️⭐️
    }
}

extension HomeVC: CustomNavigationBarProtocol {
    func didTapLeftButton() {
        print("")
    }
    
    /// 알림버튼을 누르면
    func didTapRightButton() {
        print("👍🏻")
    }
    
    ///  채팅 텍스트버튼을 누르면 호출
    func didTapRightTitleButton() {
        print("🍎")
        customNavigationBar.isVisibleNoticeMode = true
    }
}

